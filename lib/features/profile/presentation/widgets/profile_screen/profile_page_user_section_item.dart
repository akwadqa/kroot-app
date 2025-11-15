import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedding_app/gen/assets.gen.dart';
import 'package:wedding_app/src/extenssions/int_extenssion.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';

class ProfilePageUserSectionItem extends StatelessWidget {
  const ProfilePageUserSectionItem({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });
  final String title;
  final void Function()? onTap;
  final SvgGenImage icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
        margin: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: AppColors.primary.withValues(alpha: .25),
            ),
          ],
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            icon.svg(),
            13.horizontalSpace,
            Directionality(
              textDirection: ui.TextDirection.ltr,
              child: Text(
                title,
                style: AppTextStyle.rubikRegular16.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
            Spacer(),
            RotatedBox(quarterTurns: 2, child: Icon(Icons.arrow_back_ios)),
          ],
        ),
      ),
    );
  }
}



