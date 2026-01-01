import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kroot_app/features/auth/presentation/widgets/create_account_page/create_account_field.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/theme/app_colors.dart';

class EventDetailsDate extends StatelessWidget {
  const EventDetailsDate({
    super.key,
    required this.date,
    // required this.controller,
    required this.onSelectDate,
  });
  final String? date;
  final void Function(DateTime date) onSelectDate;
  // final String date;
  // final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    // return Consumer(
    //   builder: (context, ref, child) {
    final deviceLocale = Localizations.localeOf(context).toString();
    final dataFormatter = date != null
        ? DateFormat(
            'EEEE dd MMMM yyyy',
            deviceLocale,
          ).format(DateTime.parse(date!))
        : '';
    return AppTextFormField(
      // controller: controller,
      // controller: _date,
      // value: ,
      // controller: controller,
      controller: TextEditingController(text: dataFormatter),
      // value: dataFormatter,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return context.tr('required');
        }
        return null;
      },
      hint: context.tr('selectDate'),
      isRequired: false,
      label: context.tr('eventDate'),
      icon: Assets.icons.selectedDateIc,
      isReadOnly: true,
      onTap: () async {
        final date = await showDatePicker(
          builder: (context, child) => Theme(
            data: Theme.of(context).copyWith(
              datePickerTheme: DatePickerThemeData( 
                dayBackgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return AppColors.primary;
                  }
                  return null; // الافتراضي
                }),
                //   selectionColor: Colors.red,
                //   selectedDayForegroundColor: Colors.white,
              ),
            ),
            child: child!,
          ),
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
        );

        if (date != null) {
          onSelectDate(date);
        }
      },
    );
    //   },
    // );
  }
}
