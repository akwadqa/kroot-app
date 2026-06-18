import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:kroot_app/features/auth/presentation/controller/auth_ui_controller.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class AddGuestNumberField extends ConsumerStatefulWidget {
  const AddGuestNumberField(
    this.fullPhoneController, {
    super.key,
    this.focusNode,
  });

  final TextEditingController fullPhoneController;
  final FocusNode? focusNode;
  @override
  ConsumerState<AddGuestNumberField> createState() =>
      _AddGuestNumberFieldState();
}

class _AddGuestNumberFieldState extends ConsumerState<AddGuestNumberField> {
  late final TextEditingController _nationalController;
  @override
  void initState() {
    super.initState();
    _nationalController = TextEditingController();

    final fullPhone = widget.fullPhoneController.text;

    if (fullPhone.isNotEmpty) {
      final country = countries.firstWhere(
        (c) => fullPhone.startsWith(c.dialCode),
        orElse: () => countries.first,
      );

      _initialCountryCode = country.code; // ISO code
      _nationalController.text = fullPhone.substring(country.dialCode.length);
      widget.fullPhoneController.clear();
    }
  }

  @override
  void dispose() {
    _nationalController.dispose();
    super.dispose();
  }

  void _updateFullPhone(String countryCode) {
    final number = _nationalController.text.startsWith('0')
        ? _nationalController.text.substring(1)
        : _nationalController.text;
    final code =
        countryCode.startsWith('+') ? countryCode.substring(1) : countryCode;
    final full = '$code$number';

    print('''مش
    
      number : $number,

      country : $countryCode

      code : $code,


      full : $full

    ''');
    widget.fullPhoneController.value = TextEditingValue(
      text: full,
      selection: TextSelection.collapsed(offset: full.length),
    );
  }

  String _initialCountryCode = 'QA';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: IntlPhoneField(
        focusNode: widget.focusNode,
        autovalidateMode: AutovalidateMode.disabled,
        invalidNumberMessage: context.tr('invalidNumber'),
        controller: _nationalController,
        initialCountryCode: _initialCountryCode,
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
          }

          if (!val.isValidNumber()) {
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
        keyboardType: TextInputType.phone,
        style: AppTextStyle.rubikRegular14.copyWith(color: AppColors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
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
    );
  }
}
