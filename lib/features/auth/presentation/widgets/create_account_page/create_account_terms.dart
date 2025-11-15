import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedding_app/features/auth/presentation/controller/auth_controller.dart';
import 'package:wedding_app/features/auth/presentation/controller/auth_ui_controller.dart';
import 'package:wedding_app/gen/assets.gen.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';

class CreateAccountTerms extends ConsumerWidget {
  const CreateAccountTerms({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAgree = ref.watch(authUiControllerProvider).isAgree;
    return Row(
      children: [
        //? Check box :
        GestureDetector(
          onTap: () {
            ref.read(authUiControllerProvider.notifier).agreeTerms();
          },
          child: isAgree
              ? Assets.icons.agreeTermsCorrectIc.svg()
              : Container(
                  width: 18.w,
                  height: 18.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.r),
                    border: Border.all(color: AppColors.primary, width: 1.5.w),
                  ),
                ),
        ),

        14.horizontalSpace,

        //? Agree with :
        Text(
          context.tr('agreeWith'),
          style: AppTextStyle.rubikRegular16.copyWith(
            color: AppColors.grayHint,
          ),
        ),
        2.horizontalSpace,

        Text(
          context.tr('terms&conditions'),
          style: AppTextStyle.rubikRegular16.copyWith(
            color: AppColors.primary,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
