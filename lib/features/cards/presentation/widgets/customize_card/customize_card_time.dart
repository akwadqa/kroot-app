import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kroot_app/features/auth/presentation/widgets/create_account_page/create_account_field.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/theme/app_colors.dart';

class CustomizeCardTime extends StatelessWidget {
  const CustomizeCardTime({
    super.key,
    required this.dateTime,
    required this.onSelectTime,
    this.title,
    this.hint,
    this.isRequired,
    this.validator,
  });

  final String? dateTime;
  final String? title, hint;
  final bool? isRequired;

  final String? Function(String?)? validator;

  final void Function(TimeOfDay time) onSelectTime;

  DateTime? getTime() {
    if (dateTime != null) {
      final parts = dateTime?.split(':');
      final hour = int.parse(parts![0]);
      final minute = int.parse(parts[1]);

      final time = TimeOfDay(hour: hour, minute: minute);

      final now = DateTime.now();
      final combinedDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        time.hour,
        time.minute,
      );

      return combinedDateTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceLocale = Localizations.localeOf(context).toString();

    // final formattedTime = dateTime != null
    //     ? DateFormat.jm(deviceLocale).format(DateTime.parse(dateTime!))
    //     : '';

    return AppTextFormField(
      // controller: TextEditingController(text: formattedTime),
      validator: validator,
      hint: hint ?? context.tr('selectTime'),
      isRequired: isRequired ?? false,
      label: title ?? context.tr('eventTime'),
      icon: Assets.icons.selectedDateIc,
      value: dateTime,
      // value: dateTime == null
      //     ? null
      //     : DateFormat('hh:mm', 'en').format(DateTime.parse(dateTime!)),
      isReadOnly: true,
      onTap: () async {
        FocusScope.of(context).requestFocus(FocusNode());
        final initialTime = dateTime != null
            ? TimeOfDay.fromDateTime(getTime()!)
            : TimeOfDay.now();

        final time = await showTimePicker(
          context: context,
          initialTime: initialTime,
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                timePickerTheme: TimePickerThemeData(
                  hourMinuteShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hourMinuteColor: AppColors.primary.withOpacity(0.1),
                  hourMinuteTextColor: AppColors.primary,
                  dialHandColor: AppColors.primary,
                  dialBackgroundColor: AppColors.primary.withOpacity(0.08),
                  entryModeIconColor: AppColors.primary,
                ),
              ),
              child: child!,
            );
          },
        );

        if (time != null) {
          onSelectTime(time);
        }
      },
    );
  }
}
