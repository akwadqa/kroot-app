// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_app/features/event/presentation/controller/home_controller.dart';

import 'package:wedding_app/gen/assets.gen.dart';
import 'package:wedding_app/src/bottm_navigation_bar_provider.dart';
import 'package:wedding_app/src/extenssions/int_extenssion.dart';
import 'package:wedding_app/src/extenssions/widget_extensions.dart';
import 'package:wedding_app/src/routing/routes.dart';
import 'package:wedding_app/src/shared_widgets/custom_button_widget.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';

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

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(homeControllerProvider);
    return Scaffold(
      // body: _buildBody(context),
      body: controller.when(
        data: (data) {
          return _buildBody(context);
        },
        error: (e, st) {
          return Text('err');
        },
        loading: () {
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  ListView _buildBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        42.verticalSpace,

        //? Image and app bar :
        SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl:
                    'https://kroot.akwad.qa/files/event_image_20251021165520_,3pei4o3fno4j.jpg',
              ),

              Positioned(
                top: 20.h,
                right: 22.w,
                left: 22.w,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.pushReplacement(Routes.main);
                        ref.read(bottomNavIndexProvider.notifier).setIndex(0);
                      },

                      child: Assets.icons.backWhiteIc.svg(),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        _buildBottomSheet(context);
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

        //? Details section
        EventDetailsPageDetailsSection(),
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
          onTap: () {},
          isFiled: true,
          content: Text(
            context.tr('editGuestList'),
            style: AppTextStyle.nunitoBold16.copyWith(color: AppColors.white),
          ),
          height: 44.h,
          width: 330.w,
          backgroundColor: AppColors.primary,
        ).symmetricPadding(horizontal: 22.w),
        100.verticalSpace,
      ],
    );
  }

  Future<dynamic> _buildBottomSheet(BuildContext context) {
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
  const EventDetailsPageDetailsSection({super.key});

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
                DateFormat('d-M-yyyy hh:mma').format(DateTime.now()),
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
                // backgroundColor: event.status == 'Confirmed'
                //     ? AppColors.primary
                //     : AppColors.gray,
                backgroundColor: AppColors.primary,
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
            'Wedding',
            // event.type,
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
                'Riffa Halls Hall No. 15',
                // event.locationName,
                style: AppTextStyle.rubikRegular12.copyWith(
                  color: AppColors.blackText,
                ),
              ),
              Spacer(),
              CustomButtonWidget(
                content: Text(
                  'Draft',
                  // event.status,
                  style: AppTextStyle.rubikRegular14.copyWith(
                    color: AppColors.white,
                  ),
                ),
                // backgroundColor: event.status == 'Confirmed'
                //     ? AppColors.primary
                //     : AppColors.gray,
                backgroundColor: AppColors.gray,
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
        ],
      ).symmetricPadding(horizontal: 22.w),
    );
  }
}
