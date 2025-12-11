// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/event/presentation/widgets/event_details_page/event_details_page_bottom_sheet.dart';
import 'package:kroot_app/features/event/presentation/widgets/event_details_page/event_details_page_details_section.dart';
import 'package:kroot_app/features/event/presentation/widgets/event_details_page/event_details_page_item_details.dart';
import 'package:kroot_app/features/guests/presentation/controller/guest_ui_controller.dart';

import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/extenssions/int_extenssion.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/app_error_widget.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/app_toast.dart';

class EventDetailsScreen extends ConsumerStatefulWidget {
  const EventDetailsScreen({
    super.key,

    required this.eventModel,
    required this.id,
  });
  final String? id;
  final EventModel? eventModel;

  @override
  ConsumerState<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends ConsumerState<EventDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Future(() {
      if (widget.eventModel == null) {
        ref.read(homeControllerProvider.notifier).getEventDetails(widget.id!);
      }
    });
  }

  // late BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(
      homeControllerProvider.select((val) => val.value!.occasionModel),
    );

    // //? This listener for confirm event :
    // ref.listen(
    //   homeControllerProvider.select((val) => val.value!.confirmEventResponse),
    //   (prev, next) {
    //     if (next is AsyncLoading) {
    //       AppAlert.showLoadingDialog(context);
    //     }

    //     if (next is AsyncData) {
    //       context.pop();
    //       // ref
    //       //     .read(homeControllerProvider.notifier)
    //       //     .getEventDetails(widget.eventModel.occasionId!);
    //     }

    //     if (next is AsyncError) {
    //       context.pop();
    //       AppToast.errorToast(next!.error.toString());
    //     }
    //   },
    // );

    ref.listen(homeControllerProvider, (pre, next) {
      if (next.value?.isDeleteEvent != null) {
        if (next is AsyncLoading) {
          Future.delayed(Duration(milliseconds: 300), () {
            AppAlert.showLoadingDialog(
              Navigator.of(context, rootNavigator: true).context,
            );
          });
        }

        if (next is AsyncData && pre is AsyncLoading) {
          Navigator.of(context, rootNavigator: true).pop();

          AppToast.doneToast('Your event deleted successfuly!');
          context.pushReplacement(Routes.main);
          ref.read(homeControllerProvider.notifier).getUserEvents(page: 1);
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
          actionButton: widget.eventModel != null
              ? GestureDetector(
                  onTap: () {
                    _buildBottomSheet(context, widget.eventModel!);
                  },

                  child: Assets.icons.optionsIc.svg(),
                )
              : controller?.maybeWhen(
                  orElse: () => SizedBox.shrink(),
                  data: (data) {
                    return GestureDetector(
                      onTap: () {
                        _buildBottomSheet(context, widget.eventModel ?? data);
                      },

                      child: Assets.icons.optionsIc.svg(),
                    );
                  },
                ),
        ),
        body: widget.eventModel != null
            ? _buildBody(context, widget.eventModel!, ref)
            : controller?.when(
                data: (data) {
                  // Future(() {
                  //   ref
                  //       .read(homeControllerProvider.notifier)
                  //       .getUserEvents(page: 1);
                  // });
                  return _buildBody(context, data, ref);
                },
                error: (e, st) {
                  // return Text('error');
                  return AppErrorWidget(
                    onTap: () {
                      ref
                          .read(homeControllerProvider.notifier)
                          .getEventDetails(widget.id!);
                    },
                  );
                },
                loading: () {
                  return Center(child: Assets.images.animationLoading.image());
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
                    onTap: () {
                      context.push(
                        Routes.eventGuestList,
                        extra: event.occasionId,
                      );
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ref
                            .read(guestUiControllerProvider.notifier)
                            .changIndex(0);
                      });
                    },
                    // number: 10.toString(),
                    number: event.guestReport?.totalInvitees.toString() ?? '0',
                  ),

                  //? Waiting :
                  EventDetailsPageItemDetails(
                    icon: Assets.icons.waitingIc,
                    title: context.tr('waiting'),
                    onTap: () {
                      context.push(
                        Routes.eventGuestList,
                        extra: event.occasionId,
                      );
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ref
                            .read(guestUiControllerProvider.notifier)
                            .changIndex(3);
                      });
                    },
                    // number: 10.toString(),
                    number: event.guestReport?.pending.toString() ?? '0',
                  ),

                  //? Messages :
                  EventDetailsPageItemDetails(
                    icon: Assets.icons.messagesIc,
                    title: context.tr('failed'),
                    onTap: () {
                      context.push(
                        Routes.eventGuestList,
                        extra: event.occasionId,
                      );
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ref
                            .read(guestUiControllerProvider.notifier)
                            .changIndex(4);
                      });
                    },
                    // number: 10.toString(),
                    number: event.guestReport?.failed.toString() ?? '0',
                  ),

                  //? Confirmed :
                  EventDetailsPageItemDetails(
                    icon: Assets.icons.confirmedIc,
                    title: context.tr('status_confirmed'),
                    onTap: () {
                      context.push(
                        Routes.eventGuestList,
                        extra: event.occasionId,
                      );
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ref
                            .read(guestUiControllerProvider.notifier)
                            .changIndex(1);
                      });
                    },
                    // number: 10.toString(),
                    number: event.guestReport?.confirmed.toString() ?? '0',
                  ),

                  //? Rejected :
                  EventDetailsPageItemDetails(
                    icon: Assets.icons.rejectedIc,
                    title: context.tr('rejected'),
                    onTap: () {
                      context.push(
                        Routes.eventGuestList,
                        extra: event.occasionId,
                      );
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ref
                            .read(guestUiControllerProvider.notifier)
                            .changIndex(2);
                      });
                    },
                    // number: 10.toString(),
                    number: event.guestReport?.declined.toString() ?? '0',
                  ),

                  //? Scanned
                  EventDetailsPageItemDetails(
                    icon: Assets.icons.scannedIc,
                    title: context.tr('scanned'),
                    // number: 10.toString(),
                    number: event.guestReport?.scannedCount.toString() ?? '0',
                  ),
                ],
              ).symmetricPadding(horizontal: 22.w),

              20.verticalSpace,

              //? Confirm event :
              if (widget.eventModel?.status == 'Draft' ||
                  event.status == 'Draft')
                CustomButtonWidget(
                  text: '',
                  onTap: () {
                    context.push(
                      Routes.sendInvite,
                      extra: widget.eventModel != null
                          ? widget.eventModel
                          : event,
                    );
                    // ref
                    //     .read(homeControllerProvider.notifier)
                    //     .confirmEvent(
                    //       widget.eventModel?.occasionId ?? widget.id!,
                    //     );
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

              if (widget.eventModel?.status == 'Draft' ||
                  event.status == 'Draft')
                20.verticalSpace,

              //? Edit guest list :
              if (widget.eventModel?.status == 'Draft' ||
                  event.status == 'Draft')
                CustomButtonWidget(
                  text: '',
                  onTap: () {
                    context.push(
                      Routes.eventGuestList,
                      extra: event.occasionId,
                    );
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
