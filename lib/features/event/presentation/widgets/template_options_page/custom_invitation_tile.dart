
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class CustomizeInvitationTile extends StatelessWidget {
  const CustomizeInvitationTile({
    super.key,
    required this.svg,
    required this.title,
    required this.isSelected,
    this.onChanged,
  });
  final SvgGenImage svg;
  final String title;
  final bool isSelected;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.h,
      padding: EdgeInsets.symmetric(horizontal: 13.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColors.grayBorder,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.grayShadow,
            blurRadius: 2,
            spreadRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(9.r),
                border: Border.all(
                  color: AppColors.grayBorder,
                ),
              ),
              child: svg.svg()),
          14.horizontalSpace,
          Text(
            title,
            style: AppTextStyle.rubikRegular14.copyWith(
              color: AppColors.blackText,
            ),
          ),
          Spacer(),
          Checkbox(
            fillColor: WidgetStateProperty.resolveWith<Color>((states) {
              if (states.contains(WidgetState.selected)) {
                return AppColors.primary;
              }
              return AppColors.white;
            }),
            value: isSelected,
            onChanged: (val) {
              if (onChanged != null) {
                onChanged!(val);
              }
            },
          ),
        ],
      ),
    );
  }
}