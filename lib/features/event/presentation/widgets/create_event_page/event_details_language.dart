import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wedding_app/features/event/data/models/create_event_request/create_event_request.dart';
import 'package:wedding_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:wedding_app/features/event/presentation/controller/add_event/add_event_controller.dart';
import 'package:wedding_app/features/event/presentation/controller/home_controller.dart';
import 'package:wedding_app/features/event/presentation/widgets/create_event_page/create_event_page_select_language_field.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';

class EventDetailsLanguage extends StatelessWidget {
  const EventDetailsLanguage({
    super.key,

    required this.value,
    required this.onLangChang,
  });
  final String? value;
  final void Function(String? val) onLangChang;

  @override
  Widget build(BuildContext context) {
    return CreateEventPageSelectLanguageField(
      value: value,
      onChanged: (val) {
        onLangChang(val);
      },
      title: context.tr('eventLanguage'),
      items: [
        DropdownMenuItem(
          value: 'Arabic',
          child: Text(
            context.tr('arabic'),
            // 'Arabic',
            style: AppTextStyle.rubikRegular16.copyWith(
              color: AppColors.grayHint,
            ),
          ),
        ),
        DropdownMenuItem(
          value: 'English',
          child: Text(
            context.tr('english'),
            // 'English',
            style: AppTextStyle.rubikRegular16.copyWith(
              color: AppColors.grayHint,
            ),
          ),
        ),
      ],
    );
  }
}
