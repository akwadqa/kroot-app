import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kroot_app/features/auth/presentation/widgets/create_account_page/create_account_field.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/theme/app_colors.dart';

class EventDetailsTime extends StatelessWidget {
  const EventDetailsTime({
    super.key,
    required this.dateTime,
    required this.onSelectTime,
  });

  /// DateTime القادم من الـ controller (قد يكون null)
  final DateTime? dateTime;

  /// Callback لإرجاع الوقت فقط
  final void Function(TimeOfDay time) onSelectTime;

  @override
  Widget build(BuildContext context) {
    final deviceLocale = Localizations.localeOf(context).toString();

    final formattedTime = dateTime != null
        ? DateFormat.jm(deviceLocale).format(dateTime!)
        : '';

    return AppTextFormField(
      controller: TextEditingController(text: formattedTime),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return context.tr('required');
        }
        return null;
      },
      hint: context.tr('selectTime'),
      isRequired: false,
      label: context.tr('eventTime'),
      icon: Assets.icons.selectedDateIc,
      isReadOnly: true,
      onTap: () async {
        final initialTime = dateTime != null
            ? TimeOfDay.fromDateTime(dateTime!)
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
