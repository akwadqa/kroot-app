import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/extenssions/int_extenssion.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

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
      width: 150.w,
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
