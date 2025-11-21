import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class AppAlert {
  //? Main alert :

  static Future<dynamic> showGlobalDialog({
    required BuildContext context,
    required String title,
    bool isLogout = false,
    required Widget text,
    required void Function() onSubmit,
  }) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          width: 330.w,
          height: 297.h,
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //? Title :
              Text(
                title,
                style: AppTextStyle.rubikSemiBold18.copyWith(
                  color: AppColors.primary,
                ),
              ),
              20.verticalSpace,

              //? Text :
              text,
              20.verticalSpace,

              //? Sure for delete :
              CustomButtonWidget(
                text: '',
                content: Text(
                  isLogout ? context.tr('yes') : context.tr('yesDelete'),
                  style: AppTextStyle.rubikSemiBold18.copyWith(
                    color: AppColors.white,
                  ),
                ),
                backgroundColor: AppColors.primary,
                onTap: onSubmit,
                isFiled: true,
                height: 44.h,
                width: double.infinity,
              ),
              20.verticalSpace,

              //? Cancel :
              CustomButtonWidget(
                text: '',
                content: Text(
                  context.tr('cancel'),
                  style: AppTextStyle.rubikSemiBold18.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                backgroundColor: AppColors.white,
                onTap: () {
                  context.pop();
                },
                isFiled: true,
                height: 44.h,
                boxDecoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: AppColors.primary.withValues(alpha: .25),
                    ),
                  ],
                ),
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //? Loading :
  static void showLoadingDialog(BuildContext context, {bool useRootNavigator = true}) {
  showGeneralDialog(
    context: context,
    useRootNavigator: useRootNavigator,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.3), // خلفية شفافة اختيارية
    transitionDuration: const Duration(milliseconds: 150),
    pageBuilder: (ctx, animation, secondaryAnimation) {
      return PopScope(
        canPop: false, // يمنع الرجوع أثناء التحميل
        child: Center(
          child: Assets.images.animationLoading.image(),
        ),
      );
    },
  );
}

}
