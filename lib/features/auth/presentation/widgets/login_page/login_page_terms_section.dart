
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';

class LoginPageTermsSection extends StatelessWidget {
  const LoginPageTermsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
            text: '${context.tr('bySigningYouAgree')}\n',
            style: AppTextStyle.rubikRegular14.copyWith(color: AppColors.black),
          ),

          TextSpan(
            text: context.tr('termsOfUse'),
            style: AppTextStyle.rubikMedium14.copyWith(
              color: AppColors.primary,
            ),
          ),
          TextSpan(
            text: context.tr('and'),
            style: AppTextStyle.rubikRegular14.copyWith(color: AppColors.black),
          ),
          TextSpan(
            text: context.tr('privacyPolicy'),
            style: AppTextStyle.rubikMedium14.copyWith(
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}