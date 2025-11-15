import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_app/features/auth/presentation/controller/auth_ui_controller.dart';
import 'package:wedding_app/src/routing/routes.dart';
import 'package:wedding_app/src/shared_widgets/custom_button_widget.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';

class CreateAccountPageConfirmButton extends StatelessWidget {
  const CreateAccountPageConfirmButton({super.key, required this.onTap});
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final isAgree = ref.watch(authUiControllerProvider).isAgree;
        return CustomButtonWidget(
          text: '',
          onTap: isAgree
              ?onTap
              : null,
          isFiled: true,
          content: Text(
            context.tr('confirm'),
            style: AppTextStyle.rubikSemiBold18.copyWith(
              color: AppColors.white,
            ),
          ),
          height: 50.h,
          width: 330.w,
          backgroundColor: AppColors.primary,
        );
      },
    );
  }
}
