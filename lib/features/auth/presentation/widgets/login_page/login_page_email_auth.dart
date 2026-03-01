import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedding_app/gen/assets.gen.dart';
import 'package:wedding_app/src/shared_widgets/custom_button_widget.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';

class LoginPageEmailAuth extends StatelessWidget {
  const LoginPageEmailAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 2,
            spreadRadius: 0,
            color: AppColors.grayShadow,
          ),
        ],
      ),
      child: CustomButtonWidget(
        text: '',
        onTap: () {},
        isFiled: true,
        height: 50,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.icons.emailIc.svg(),
            10.horizontalSpace,
            Text(
              context.tr('continueWithEmail'),
              style: AppTextStyle.bodysmallSemibold.copyWith(
                color: AppColors.secondary500,
              ),
            ),
          ],
        ),
        width: 330,
        color: AppColors.grayBorder,
        backgroundColor: AppColors.white,
      ),
    );
  }
}
