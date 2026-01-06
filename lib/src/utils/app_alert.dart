import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class AppAlert {
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
              Text(
                title,
                style: AppTextStyle.rubikSemiBold18.copyWith(
                  color: AppColors.primary,
                ),
              ),
              20.verticalSpace,

              text,
              20.verticalSpace,

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

  static void showLoadingDialog(
    BuildContext context, {
    bool useRootNavigator = true,
  }) {
    showGeneralDialog(
      context: context,
      useRootNavigator: useRootNavigator,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.3),
      transitionDuration: const Duration(milliseconds: 150),
      pageBuilder: (ctx, animation, secondaryAnimation) {
        return PopScope(
          canPop: false,
          child: Center(child: MailPulseAnimation()),
        );
      },
    );
  }
}

class MailPulseAnimation extends StatefulWidget {
  const MailPulseAnimation({super.key});

  @override
  State<MailPulseAnimation> createState() => _MailPulseAnimationState();
}

class _MailPulseAnimationState extends State<MailPulseAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;
  late Animation<double> _rotation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _scale = Tween<double>(
      begin: 0.85,
      end: 1.15,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _rotation = Tween<double>(
      begin: -0.05,
      end: 0.05,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Transform.rotate(
          angle: _rotation.value,
          child: Transform.scale(
            scale: _scale.value,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.mail, color: Colors.white, size: 40),
            ),
          ),
        );
      },
    );
  }
}
