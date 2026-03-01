import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';

class VerificationPagePin extends StatelessWidget {
  const VerificationPagePin({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    var pinTheme = PinTheme(
      textStyle: AppTextStyle.rubikRegular20.copyWith(color: AppColors.primary),
      width: 40.w,
      height: 63.w,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.grayBorder),
        borderRadius: BorderRadius.circular(10.r),
      ),
    );

    return Pinput(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter code';
        }
        if (value.length != 6) {
          return 'The code must be 6 numbers';
        }
        return null;
      },
      readOnly: true,
      controller: controller,
      showCursor: false,
      preFilledWidget: Text(
        '-',
        style: AppTextStyle.rubikRegular20.copyWith(color: AppColors.primary),
      ),
      focusedPinTheme: pinTheme.copyBorderWith(
        border: Border.all(color: AppColors.primary),
      ),
      errorPinTheme: pinTheme.copyBorderWith(
        border: Border.all(color: AppColors.darkRed),
      ),
      length: 6,
      defaultPinTheme: pinTheme,
    );
  }
}
