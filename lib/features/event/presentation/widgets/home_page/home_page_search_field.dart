import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class HomePageSearchField extends StatelessWidget {
  const HomePageSearchField({
    super.key,
    required this.hint,
    this.onSubmit,
    this.isLocation = false,
    this.onChange,
  });
  final String hint;
  final void Function(String?)? onSubmit;
  final void Function(String)? onChange;
  final bool isLocation;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isLocation ? AppColors.white : AppColors.grayField,
        border: Border.all(color: AppColors.grayBorder),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 2,
            spreadRadius: 0,
            color: AppColors.grayShadow.withValues(alpha: .24),
          ),
        ],
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextField(
        onChanged: (val) => onChange != null ? onChange!(val) : null,
        onSubmitted: (val) {
          onSubmit != null ? onSubmit!(val) : null;
        },
        cursorColor: AppColors.primary,
        style: AppTextStyle.rubikRegular14.copyWith(color: AppColors.primary),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppTextStyle.rubikRegular14.copyWith(
            color: AppColors.grayHint,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Assets.icons.eventSearchIc.svg(),
          ),

          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
