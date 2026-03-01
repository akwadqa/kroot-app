
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedding_app/gen/assets.gen.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';

class VerificationPageInputButton extends StatelessWidget {
  const VerificationPageInputButton({
    super.key,
    required this.label,
    required this.child,
    this.isSubmit = false,
    this.isDelete = false,
    this.onTap,
  });

  factory VerificationPageInputButton.label(
    String label,
    void Function()? onTap,
  ) {
    return VerificationPageInputButton(
      label: label,
      onTap: onTap,
      child: Text(
        label,
        style: AppTextStyle.rubikRegular25.copyWith(color: AppColors.primary),
      ),
    );
  }

  factory VerificationPageInputButton.delet(void Function() onTap) {
    return VerificationPageInputButton(
      label: '',
      isDelete: true,
      onTap: onTap,
      child: Assets.icons.deleteIc.svg(),
    );
  }

  factory VerificationPageInputButton.done(void Function()? onTap) {
    return VerificationPageInputButton(
      label: '',
      isSubmit: true,
      onTap: onTap,
      child: Assets.icons.correctIc.svg(),
    );
  }

  final String label;
  final Widget child;
  final bool isDelete, isSubmit;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: Material(
        color: isSubmit ? AppColors.primary : null,
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grayBorder),
              borderRadius: BorderRadius.circular(10.r),
            ),
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}

final keys = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '', '0', ''];
