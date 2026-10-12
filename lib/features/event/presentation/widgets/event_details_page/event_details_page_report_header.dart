import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class EventDetailsPageReportHeader extends StatelessWidget {
  const EventDetailsPageReportHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
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
      ],
    );
  }
}
