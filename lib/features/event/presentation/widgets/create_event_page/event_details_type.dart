import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/event/presentation/widgets/create_event_page/create_event_page_select_language_field.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class EventDetailsType extends ConsumerWidget {
  const EventDetailsType({
    super.key,
    required this.value,
    required this.onTypeChange,
  });
  final String? value;
  final void Function(String? val) onTypeChange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(
      homeControllerProvider.select((val) {
        return val.value!.utilsResponse!.value!.eventTypes;
      }),
    );

    return CreateEventPageSelectLanguageField(
      value: value,
      onChanged: (val) {
        onTypeChange(val);
      },
      title: context.tr('eventType'),
      items: items!
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: Text(
                e,
                style: AppTextStyle.rubikRegular16.copyWith(
                  color: AppColors.grayHint,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
