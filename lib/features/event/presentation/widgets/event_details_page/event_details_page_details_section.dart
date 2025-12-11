import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

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

              // CustomButtonWidget(
              //   content: Text(
              //     // 'Active',
              //     event.status!,
              //     style: AppTextStyle.rubikRegular14.copyWith(
              //       color: AppColors.white,
              //     ),
              //   ),
              //   backgroundColor: event.status == 'Confirmed'
              //       ? AppColors.primary
              //       : AppColors.gray,
              //   // backgroundColor: AppColors.primary,
              //   text: '',
              //   radius: 32.r,
              //   onTap: () {},
              //   isFiled: false,
              //   height: 25.h,
              //   width: 64.w,
              //   topPading: 0,
              // ),
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
              SizedBox(
                width: 300.w,
                child: Text(
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  // 'Riffa Halls Hall No. 15',
                  event.locationName ?? '',
                  style: AppTextStyle.rubikRegular12.copyWith(
                    color: AppColors.blackText,
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ],
      ).symmetricPadding(horizontal: 22.w),
    );
  }
}
