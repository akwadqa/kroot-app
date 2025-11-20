import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wedding_app/features/auth/presentation/widgets/create_account_page/create_account_field.dart';
import 'package:wedding_app/features/event/data/models/create_event_request/create_event_request.dart';
import 'package:wedding_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:wedding_app/features/event/presentation/controller/add_event/add_event_controller.dart';
import 'package:wedding_app/features/event/presentation/controller/home_controller.dart';
import 'package:wedding_app/gen/assets.gen.dart';

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
    final dataFormatter = date != null
        ? DateFormat('EEE, d-M-yyyy hh:mma').format(DateTime.parse(date!))
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
      },
      hint: context.tr('selectDate'),
      isRequired: false,
      label: context.tr('eventDate'),
      icon: Assets.icons.selectedDateIc,
      isReadOnly: true,
      onTap: () async {
        final date = await showDatePicker(
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
