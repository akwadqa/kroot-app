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

import 'package:wedding_app/gen/assets.gen.dart';
import 'package:wedding_app/src/bottm_navigation_bar_provider.dart';
import 'package:wedding_app/src/extenssions/int_extenssion.dart';
import 'package:wedding_app/src/extenssions/widget_extensions.dart';
import 'package:wedding_app/src/routing/routes.dart';
import 'package:wedding_app/src/shared_widgets/custom_button_widget.dart';
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
    final ctx = Navigator.of(context, rootNavigator: true).context;
    final controller = ref.watch(homeControllerProvider);
    // ref.listen(homeControllerProvider, (pre, next) {
    //   //? Listener for delete event :
    //   if (next.value?.isDeleteEvent != null) {
    //     if (next is AsyncLoading) {
    //       AppAlert.showLoadingDialog(ctx, useRootNavigator: true);
    //     }

    //     if (next is AsyncData && pre is AsyncLoading) {
    //       ctx.pop();
    //       // Navigator.of(context, rootNavigator: true).pop();

    //       AppToast.doneToast('Your event deleted successfuly!');
    //       context.pushReplacement(Routes.main);
    //     }
    //     if (next is AsyncError) {
    //       // ctx.pop();
    //       Navigator.of(context, rootNavigator: true).pop();

    //       AppToast.errorToast(next.error.toString());
    //       // context.pushReplacement(Routes.main);
    //     }
    //   }
    // });
    ref.listen(homeControllerProvider, (pre, next) {
      if (next.value?.isDeleteEvent != null) {
        if (next is AsyncLoading) {
          print('------------------');
          print("SHOW LOADING ON: $ctx");
          Future.delayed(Duration(seconds: 1), () {
            AppAlert.showLoadingDialog(
              Navigator.of(context, rootNavigator: true).context,
            );
          });
        }

        if (next is AsyncData && pre is AsyncLoading) {
          Navigator.of(context, rootNavigator: true).pop();
          print("POP ON: $ctx");
          print('------------------');

          AppToast.doneToast('Your event deleted successfuly!');
          context.pushReplacement(Routes.main);
        }

        if (next is AsyncError) {
          Navigator.of(context, rootNavigator: true).pop();
          AppToast.errorToast(next.error.toString());
        }
      }
    });

    return Scaffold(
      // body: _buildBody(context),
      body: Builder(
        builder: (context) {
          // ctx = context;

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

    return Builder(
      builder: (context) {
        // ctx = context;
        return Column(
          // padding: EdgeInsets.zero,
          children: [
            // 42.verticalSpace,

            //? Image and app bar :
            SizedBox(
              // width: double.infinity,
              width: 375.w,
              height: resolveImageUrl() != null ? 231.h : 100.h,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: resolveImageUrl() != null
                        ? CachedNetworkImage(
                            imageUrl: resolveImageUrl() ?? '',
                            fit: BoxFit.contain,
                            // alignment: Alignment.center,
                            // 'https://kroot.akwad.qa/files/event_image_20251021165520_,3pei4o3fno4j.jpg',
                          )
                        : Container(
                            // width: double.infinity,
                            // height: 100.h,
                            color: AppColors.primary,
                          ),
                  ),

                  Positioned(
                    top: 66.h,
                    right: 22.w,
                    left: 22.w,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // context.pushReplacement(Routes.main);
                            context.pop();
                            ref
                                .read(bottomNavIndexProvider.notifier)
                                .setIndex(0);
                          },

                          child: Assets.icons.backWhiteIc.svg(),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            _buildBottomSheet(context, ref, event);
                          },

                          child: Assets.icons.optionsIc.svg(),
                        ),
                      ],
                    ),
                  ),
                ],
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
                    spacing: 25.w,
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
                  CustomButtonWidget(
                    text: '',
                    onTap: () {
                      context.push(Routes.eventGuestList);
                    },
                    isFiled: true,
                    content: Text(
                      context.tr('editGuestList'),
                      style: AppTextStyle.nunitoBold16.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    height: 44.h,
                    width: 330.w,
                    backgroundColor: AppColors.primary,
                  ).symmetricPadding(horizontal: 22.w),
                  100.verticalSpace,
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> _buildBottomSheet(
    BuildContext context,
    WidgetRef ref,
    EventModel event,
  ) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(22.w),
        child: Column(
          children: [
            //? App bar :
            Row(
              children: [
                //? Title :
                Text(
                  context.tr('moreOptions'),
                  style: AppTextStyle.rubikSemiBold20.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                Spacer(),

                //? Close button :
                GestureDetector(
                  onTap: () => context.pop(),
                  child: Assets.icons.closeIc.svg(),
                ),
              ],
            ),
            33.verticalSpace,

            //? Manage access :
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Assets.icons.manageAccessIc.svg(),
              title: Text(
                context.tr('manageAccess'),
                style: AppTextStyle.rubikMedium16.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
            Divider(color: AppColors.lightGray02, height: 0),

            //? Edit event :
            ListTile(
              onTap: () {
                context.push(Routes.updateEvent, extra: event.occasionId);
                // ref
                //     .read(homeControllerProvider.notifier)
                //     .updateEvent(CreateEventRequest());
              },
              contentPadding: EdgeInsets.zero,
              leading: Assets.icons.editEventIc.svg(),
              title: Text(
                context.tr('editEvent'),
                style: AppTextStyle.rubikMedium16.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
            Divider(color: AppColors.lightGray02, height: 0),
            ListTile(
              onTap: () {
                AppAlert.showGlobalDialog(
                  context: context,
                  title: context.tr('deleteEvent'),
                  text: Text(
                    context.tr('deleteEventAlert'),
                    style: AppTextStyle.rubikRegular14.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  onSubmit: () {
                    context.pop();
                    context.pop();
                    ref
                        .read(homeControllerProvider.notifier)
                        .deleteEvent(event.occasionId ?? '');
                  },
                );
              },
              contentPadding: EdgeInsets.zero,
              leading: Assets.icons.deleteEventIc.svg(),
              title: Text(
                context.tr('deleteEvent'),
                style: AppTextStyle.rubikMedium16.copyWith(
                  color: AppColors.noticeRed,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventDetailsPageItemDetails extends StatelessWidget {
  const EventDetailsPageItemDetails({
    super.key,
    required this.title,
    required this.number,
    required this.icon,
  });
  final String number, title;
  final SvgGenImage icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.w,
      height: 156.h,
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: AppColors.black.withValues(alpha: .25),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // Assets.icons.invitedIc.svg(),
          icon.svg(),
          15.verticalSpace,
          Text(
            title,
            style: AppTextStyle.nunitoSemibold14.copyWith(
              color: AppColors.primary,
            ),
          ),
          10.verticalSpace,
          Text(
            number,
            style: AppTextStyle.nunitoSemibold16.copyWith(
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class EventDetailsPageDetailsSection extends StatelessWidget {
  const EventDetailsPageDetailsSection({super.key, required this.event});

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //? Date :
              Text(
                // DateFormat('EEE, d-M-yyyy hh:mma').format(event.date),
                // DateFormat('d-M-yyyy hh:mma').format(DateTime.now()),
                DateFormat(
                  'd-M-yyyy hh:mma',
                ).format(DateTime.parse(event.date ?? '')),
                style: AppTextStyle.rubikRegular12.copyWith(
                  color: AppColors.blackText,
                ),
              ),
              Spacer(),

              CustomButtonWidget(
                content: Text(
                  'Active',
                  // event.status,
                  style: AppTextStyle.rubikRegular14.copyWith(
                    color: AppColors.white,
                  ),
                ),
                backgroundColor: event.status == 'Confirmed'
                    ? AppColors.primary
                    : AppColors.gray,
                // backgroundColor: AppColors.primary,
                text: '',
                radius: 32.r,
                onTap: () {},
                isFiled: false,
                height: 25.h,
                width: 64.w,
                topPading: 0,
              ),
            ],
          ),
          5.verticalSpace,
          Text(
            // 'Wedding',
            event.type ?? '',
            style: AppTextStyle.rubikSemiBold16.copyWith(
              color: AppColors.primary,
            ),
          ),
          18.verticalSpace,
          //? Location :
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Assets.icons.locationIc.svg(),
              5.horizontalSpace,
              Text(
                softWrap: true,
                overflow: TextOverflow.visible,
                // 'Riffa Halls Hall No. 15',
                event.locationName ?? '',
                style: AppTextStyle.rubikRegular12.copyWith(
                  color: AppColors.blackText,
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 11.w),
                decoration: BoxDecoration(
                  color: event.status == 'Confirmed'
                      ? AppColors.primary
                      : AppColors.gray,

                  borderRadius: BorderRadius.circular(32.r),
                ),
                child: Text(
                  // 'Draft',
                  event.status ?? '',
                  style: AppTextStyle.rubikRegular14.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
              // CustomButtonWidget(
              //   content: Text(
              //     // 'Draft',
              //     event.status ?? '',
              //     style: AppTextStyle.rubikRegular14.copyWith(
              //       color: AppColors.white,
              //     ),
              //   ),
              //   backgroundColor: event.status == 'Confirmed'
              //       ? AppColors.primary
              //       : AppColors.gray,
              //   // backgroundColor: AppColors.gray,
              //   text: '',
              //   radius: 32.r,
              //   onTap: () {},
              //   isFiled: false,
              //   height: 25.h,
              //   width: 64.w,
              //   topPading: 0,
              // ),
            ],
          ),
        ],
      ).symmetricPadding(horizontal: 22.w),
    );
  }
}
