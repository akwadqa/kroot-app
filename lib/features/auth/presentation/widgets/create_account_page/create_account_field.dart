import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.controller,
    required this.hint,
    required this.label,
    this.isReadOnly = false,
    this.icon,
    required this.isRequired,
    this.onTap,
    this.withIcon = true,
    this.validator,
    this.inputType = TextInputType.text,
    this.value,
  });
  final void Function()? onTap;
  final String? value;
  final String hint, label;
  final SvgGenImage? icon;
  final TextInputType? inputType;
  final bool isRequired, isReadOnly, withIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  String? requiredVal(String? val, BuildContext context) {
    if ((val?.isEmpty ?? true) || val == null) {
      return context.tr('required');
    }
    return null;
  }

  String? emailVal(String? val, BuildContext context) {
    if ((val?.isEmpty ?? true) || val == null) {
      return null;
    } else {
      if (!val.contains('@')) {
        return context.tr('emailValidatorMessage');
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(label, style: AppTextStyle.rubikRegular18),
            8.horizontalSpace,
            if (isRequired)
              Text(
                '*',
                style: AppTextStyle.poppinsMedium16.copyWith(
                  color: AppColors.red,
                ),
              ),
          ],
        ),
        12.verticalSpace,
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 2,
                spreadRadius: 3,
                color: AppColors.grayShadow.withValues(alpha: .24),
              ),
            ],
          ),
          child: TextFormField(
            // key: ValueKey(value),
            // initialValue: value,
            onTap: onTap,
            keyboardType: inputType,
            readOnly: isReadOnly,
            controller: controller,
            validator:
                validator ??
                (val) => isRequired
                    ? requiredVal(val, context)
                    : emailVal(val, context),
            cursorColor: AppColors.primary,
            style: AppTextStyle.rubikRegular16.copyWith(
              color: AppColors.primary,
            ),
            decoration: InputDecoration(
              suffixIcon: isReadOnly
                  ? Icon(
                      Icons.arrow_drop_down_rounded,
                      color: AppColors.primary,
                    )
                  : null,
              hintText: hint,
              hintStyle: AppTextStyle.rubikRegular16.copyWith(
                color: AppColors.grayHint,
              ),

              contentPadding: EdgeInsets.zero,
              prefixIcon: withIcon!
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17.w),
                      child: icon!.svg(),
                    )
                  : null,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: AppColors.primary),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: AppColors.grayBorder),
              ),
              // prefixIconConstraints: BoxConstraints(maxWidth: 18),
            ),
          ),
        ),
      ],
    );
  }
}
