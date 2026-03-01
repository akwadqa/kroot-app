import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:wedding_app/features/auth/presentation/controller/auth_ui_controller.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';

class LoginPageNumberField extends ConsumerStatefulWidget {
  const LoginPageNumberField(
    this.fullPhoneController,
    this.formKey, {
    super.key,
  });

  final TextEditingController fullPhoneController;
  final GlobalKey<FormState> formKey;

  @override
  ConsumerState<LoginPageNumberField> createState() =>
      _LoginPageNumberFieldState();
}

class _LoginPageNumberFieldState extends ConsumerState<LoginPageNumberField> {
  late final TextEditingController _nationalController;
  @override
  void initState() {
    super.initState();
    _nationalController = TextEditingController();
  }

  @override
  void dispose() {
    _nationalController.dispose();
    super.dispose();
  }

  void _updateFullPhone(String countryCode) {
    final number = _nationalController.text;
    final full = '$countryCode$number';
    widget.fullPhoneController.value = TextEditingValue(
      text: full,
      selection: TextSelection.collapsed(offset: full.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Directionality(
        textDirection: ui.TextDirection.ltr,
        child: IntlPhoneField(
          invalidNumberMessage: context.tr('invalidNumber'),
          controller: _nationalController,
          initialCountryCode: 'QA',
          onChanged: (phone) {
            _updateFullPhone(phone.countryCode);

            ref
                .read(authUiControllerProvider.notifier)
                .checkPhoneFilled(phone.number.isNotEmpty);
          },
          onCountryChanged: (country) {
            _updateFullPhone('+${country.dialCode}');
          },
          validator: (val) {
            if (val == null || val.number.isEmpty) {
              return context.tr('enterPhone');
            } else if (val.number.length < 9) {
              return context.tr('invalidNumber');
            }
            return null;
          },

          dropdownIcon: Icon(
            Icons.arrow_drop_down_rounded,
            color: AppColors.primary,
          ),
          cursorColor: AppColors.primary,
          flagsButtonPadding: EdgeInsets.fromLTRB(16.w, 16.w, 0, 16.w),
          dropdownIconPosition: IconPosition.trailing,
          dropdownTextStyle: AppTextStyle.rubikRegular14.copyWith(
            color: AppColors.primary,
          ),
          keyboardType: TextInputType.phone, // أفضل للهاتف
          style: AppTextStyle.rubikRegular14.copyWith(color: AppColors.black),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
              borderRadius: BorderRadius.circular(10.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.grayBorder),
              borderRadius: BorderRadius.circular(10.r),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.grayBorder),
              borderRadius: BorderRadius.circular(10.r),
            ),
            hintText: '000-000-00',
            hintStyle: AppTextStyle.rubikRegular14.copyWith(
              color: AppColors.grayHint,
            ),
          ),
        ),
      ),
    );
  }
}
