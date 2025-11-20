// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_app/features/event/data/models/create_event_request/create_event_request.dart';
import 'package:wedding_app/features/event/data/models/events_response/event_response.dart';
import 'package:wedding_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:wedding_app/features/event/data/models/occasion_response/occasion_response.dart';
import 'package:wedding_app/features/event/presentation/controller/home_controller.dart';
import 'package:wedding_app/features/event/presentation/widgets/event_details_page/event_details_page_bottom_sheet.dart';
import 'package:wedding_app/features/event/presentation/widgets/event_details_page/event_details_page_details_section.dart';
import 'package:wedding_app/features/event/presentation/widgets/event_details_page/event_details_page_item_details.dart';
import 'package:wedding_app/features/guests/data/repositories/guests_repository.dart';

import 'package:wedding_app/gen/assets.gen.dart';
import 'package:wedding_app/src/bottm_navigation_bar_provider.dart';
import 'package:wedding_app/src/extenssions/int_extenssion.dart';
import 'package:wedding_app/src/extenssions/widget_extensions.dart';
import 'package:wedding_app/src/routing/routes.dart';
import 'package:wedding_app/src/shared_widgets/custom_appbar.dart';
import 'package:wedding_app/src/shared_widgets/custom_button_widget.dart';
import 'package:wedding_app/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';
import 'package:wedding_app/src/utils/app_alert.dart';
import 'package:wedding_app/src/utils/app_toast.dart';

class EventDetailsScreen extends ConsumerStatefulWidget {
  const EventDetailsScreen({super.key, required this.id});
  final String id;

  @override
  ConsumerState<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends ConsumerState<EventDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(homeControllerProvider.notifier).getEventDetails(widget.id);
    });
  }

  // late BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(homeControllerProvider);

    //? This listener for confirm event :
    ref.listen(
      homeControllerProvider.select((val) => val.value!.confirmEventResponse),
      (prev, next) {
        if (next is AsyncLoading) {
          AppAlert.showLoadingDialog(context);
        }

        if (next is AsyncData) {
          context.pop();
          ref.read(homeControllerProvider.notifier).getEventDetails(widget.id);
        }

        if (next is AsyncError) {
          context.pop();
          AppToast.errorToast(next!.error.toString());
        }
      },
    );

    ref.listen(homeControllerProvider, (pre, next) {
      if (next.value?.isDeleteEvent != null) {
        if (next is AsyncLoading) {
          Future.delayed(Duration(seconds: 1), () {
            AppAlert.showLoadingDialog(
              Navigator.of(context, rootNavigator: true).context,
            );
          });
        }

        if (next is AsyncData && pre is AsyncLoading) {
          Navigator.of(context, rootNavigator: true).pop();

          AppToast.doneToast('Your event deleted successfuly!');
          context.pushReplacement(Routes.main);
        }

        if (next is AsyncError) {
          Navigator.of(context, rootNavigator: true).pop();
          AppToast.errorToast(next.error.toString());
        }
      }
    });

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (context.canPop()) {
          print('here we poped!');
          context.pop();
        } else {
          print('here we pushed!');
          context.go(Routes.main);
        }
      },
      child: Scaffold(
        appBar: CustomAppbar(
          title: 'Event Details',
          withBackButton: true,
          actionButton: controller.maybeWhen(
            orElse: () => SizedBox.shrink(),
            data: (data) {
              return GestureDetector(
                onTap: () {
                  _buildBottomSheet(context, data.occasionModel!);
                },

                child: Assets.icons.optionsIc.svg(),
              );
            },
          ),
        ),
        body: Builder(
          builder: (context) {
            return controller.when(
              data: (data) {
                if (data.occasionModel != null) {
                  return _buildBody(context, data.occasionModel!, ref);
                }
                return SizedBox();
              },
              error: (e, st) {
                if (controller.value!.isDeleteEvent != null &&
                    controller.value?.occasionModel != null) {
                  return _buildBody(
                    context,
                    controller.value!.occasionModel!,
                    ref,
                  );
                }
                return Text('error');
              },
              loading: () {
                // Assets.images.animationLoading.image
                if (controller.value!.isDeleteEvent != null &&
                    controller.value?.occasionModel != null) {
                  return _buildBody(
                    context,
                    controller.value!.occasionModel!,
                    ref,
                  );
                }
                return Center(child: Assets.images.animationLoading.image());
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, EventModel event, WidgetRef ref) {
    String? resolveImageUrl() {
      final imagePath = event.imageUrl;
      final baseUrl = 'https://kroot.akwad.qa/';
      if (imagePath == null || imagePath.isEmpty) return null;
      if (imagePath.startsWith('http')) return imagePath;
      final base = baseUrl.endsWith('/') ? baseUrl : '$baseUrl/';
      final path = imagePath.startsWith('/')
          ? imagePath.substring(1)
          : imagePath;
      return '$base$path';
    }

    return Column(
      children: [
        12.verticalSpace,
        //? Image and app bar :
        SizedBox(
          // width: double.infinity,
          width: 375.w,
          height: resolveImageUrl() != null ? 231.h : 0,
          child: Center(
            child: resolveImageUrl() != null
                ? CachedNetworkImage(
                    fadeInCurve: Curves.linear,
                    placeholder: (context, url) => FadeCircleLoadingIndicator(),
                    imageUrl: resolveImageUrl() ?? '',
                    fit: BoxFit.contain,
                    // alignment: Alignment.center,
                    // 'https://kroot.akwad.qa/files/event_image_20251021165520_,3pei4o3fno4j.jpg',
                  )
                : SizedBox.shrink(),
          ),
        ),

        20.verticalSpace,

        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              //? Details section
              EventDetailsPageDetailsSection(event: event),
              20.verticalSpace,
              Divider(color: AppColors.grayBorder),
              20.verticalSpace,

              Text(
                context.tr('invitationReport'),
                style: AppTextStyle.nunitoSemibold16.copyWith(
                  color: AppColors.primary,
                ),
              ).onlyPadding(start: 22.w, bottom: 12.h),

              Text(
                context.tr('inviteReportHere'),
                style: AppTextStyle.rubikRegular14.copyWith(
                  color: AppColors.blackText,
                ),
              ).onlyPadding(start: 22.w, bottom: 20.h),

              Wrap(
                spacing: 12.w,
                runSpacing: 15.h,
                alignment: WrapAlignment.center,
                children: [
                  //? Invited :
                  EventDetailsPageItemDetails(
                    icon: Assets.icons.invitedIc,
                    title: context.tr('invited'),
                    number: 10.toString(),
                  ),

                  //? Waiting :
                  EventDetailsPageItemDetails(
                    icon: Assets.icons.waitingIc,
                    title: context.tr('waiting'),
                    number: 10.toString(),
                  ),

                  //? Messages :
                  EventDetailsPageItemDetails(
                    icon: Assets.icons.messagesIc,
                    title: context.tr('messages'),
                    number: 10.toString(),
                  ),

                  //? Confirmed :
                  EventDetailsPageItemDetails(
                    icon: Assets.icons.confirmedIc,
                    title: context.tr('status_confirmed'),
                    number: 10.toString(),
                  ),

                  //? Rejected :
                  EventDetailsPageItemDetails(
                    icon: Assets.icons.rejectedIc,
                    title: context.tr('rejected'),
                    number: 10.toString(),
                  ),

                  //? Scanned
                  EventDetailsPageItemDetails(
                    icon: Assets.icons.scannedIc,
                    title: context.tr('scanned'),
                    number: 10.toString(),
                  ),
                ],
              ).symmetricPadding(horizontal: 22.w),

              20.verticalSpace,

              //? Confirm event :
              CustomButtonWidget(
                text: '',
                onTap: () async {
                  // context.push(Routes.eventGuestList);
                  ref
                      .read(homeControllerProvider.notifier)
                      .confirmEvent(widget.id);
                },
                isFiled: true,
                content: Text(
                  context.tr('confirmEvent'),
                  style: AppTextStyle.nunitoBold16.copyWith(
                    color: AppColors.white,
                  ),
                ),
                height: 44.h,
                width: 330.w,
                backgroundColor: AppColors.primary,
              ).symmetricPadding(horizontal: 22.w),

              20.verticalSpace,

              //? Edit guest list :
              CustomButtonWidget(
                text: '',
                onTap: () {
                  context.push(Routes.eventGuestList);
                },
                isFiled: true,
                content: Text(
                  context.tr('editGuestList'),
                  style: AppTextStyle.nunitoBold16.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                boxDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: AppColors.primary.withValues(alpha: .25),
                    ),
                  ],
                ),
                height: 44.h,
                width: 330.w,
                backgroundColor: AppColors.white,
              ).symmetricPadding(horizontal: 22.w),
              40.verticalSpace,
            ],
          ),
        ),
      ],
    );
  }

  Future<dynamic> _buildBottomSheet(BuildContext context, EventModel event) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => EventDetailsPageBottomSheet(event: event),
    );
  }
}
