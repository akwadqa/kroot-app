import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/auth/presentation/widgets/create_account_page/create_account_field.dart';
import 'package:kroot_app/features/cards/domain/template_field_model/template_field_model.dart';
import 'package:kroot_app/features/cards/presentation/controller/cards_controller.dart';
import 'package:kroot_app/features/cards/presentation/widgets/customize_card/customize_card_date.dart';
import 'package:kroot_app/features/cards/presentation/widgets/customize_card/customize_card_time.dart';
import 'package:kroot_app/features/event/presentation/widgets/create_event_page/create_event_page_select_language_field.dart';
import 'package:kroot_app/features/event/presentation/widgets/create_event_page/event_details_date.dart';
import 'package:kroot_app/features/event/presentation/widgets/create_event_page/event_details_time.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class CustomizeCardScreenForm extends ConsumerStatefulWidget {
  const CustomizeCardScreenForm({
    super.key,
    required this.fields,
    required this.templateName,
  });
  final List<TemplateFieldModel> fields;
  final String templateName;

  @override
  ConsumerState<CustomizeCardScreenForm> createState() =>
      _CustomizeCardScreenFormState();
}

class _CustomizeCardScreenFormState
    extends ConsumerState<CustomizeCardScreenForm> {
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final time = ref
        .watch(cardsControllerProvider)
        .value!
        .fieldsValues
        .where((element) => element.keys.first == 'event_time')
        .map((e) => e.values.first.toString())
        .firstOrNull
        ?.toString();

    final date = ref
        .watch(cardsControllerProvider)
        .value!
        .fieldsValues
        .where((element) => element.keys.first == 'event_date')
        .map((e) => e.values.first.toString())
        .firstOrNull
        ?.toString();
    return Form(
      key: key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //? Title :
          Text(
            'enter_details_below'.tr(),
            style:
                AppTextStyle.rubikMedium18.copyWith(color: AppColors.primary),
          ),
          20.verticalSpace,

          ListView.separated(
            separatorBuilder: (context, index) => SizedBox(),
            // separatorBuilder: (context, index) => 18.verticalSpace,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final currentField = widget.fields[index];
              switch (currentField.fieldType) {
                case 'Select':
                  final value = ref
                      .watch(cardsControllerProvider)
                      .value!
                      .fieldsValues
                      .where((element) =>
                          element.keys.first == currentField.fieldName)
                      .map((e) => e.values.first.toString())
                      .firstOrNull;
                  return Column(
                    children: [
                      CreateEventPageSelectLanguageField(
                        items: currentField.selectOptions
                                ?.map(
                                  (option) => DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  ),
                                )
                                .toList() ??
                            [],
                        onChanged: (String? value) {
                          ref
                              .read(cardsControllerProvider.notifier)
                              .addFieldValue(
                                fieldName: currentField.fieldName ?? '',
                                fieldValue: value ?? '',
                              );
                        },
                        value: (currentField.selectOptions!.contains(value) ||
                                value == null ||
                                value.isEmpty)
                            ? value
                            // : 'أخرى',
                            : currentField.selectOptions!.last,
                        title: currentField.fieldLabel ?? '',
                      ).onlyPadding(bottom: 18),
                      if (value == 'أخرى' ||
                          (!currentField.selectOptions!.contains(value) &&
                              value != null &&
                              value.isNotEmpty))
                        AppTextFormField(
                          withIcon: false,
                          onChanged: (text_val) {
                            if (text_val.isNotEmpty) {
                              ref
                                  .read(cardsControllerProvider.notifier)
                                  .addFieldValue(
                                    fieldName: currentField.fieldName ?? '',
                                    fieldValue: text_val,
                                  );
                            }
                          },
                          isReadOnly: false,
                          hint: currentField.placeholder ?? '',
                          isRequired: currentField.isRequired ?? false,
                          validator: (currentField.isRequired ?? false)
                              ? (val) {
                                  if (val == null || val.isEmpty) {
                                    return context.tr('required');
                                  }
                                  return null;
                                }
                              : (val) => null,
                          label: currentField.fieldLabel ?? '',
                          icon: Assets.icons.eventNameIc,
                        )
                    ],
                  );
                case 'Text':
                  if (currentField.fieldName?.contains('predefined_text') ??
                      false) {
                    final currentIndex = int.tryParse(
                        currentField.fieldName?.split('_').last ?? '');
                    final dropDownValue = ref
                        .watch(cardsControllerProvider)
                        .value!
                        .fieldsValues
                        .where((element) => element.keys.first
                            .contains(currentIndex?.toString() ?? '0'))
                        .map((e) => e.values.first.toString())
                        .firstOrNull;
                    if (dropDownValue == 'أخرى') {
                      // if (currentField.fieldName == 'predefined_text_2') {
                      //   final dropDownValue = ref
                      //       .watch(cardsControllerProvider)
                      //       .value!
                      //       .fieldsValues
                      //       .where((element) =>
                      //           element.keys.first == 'predefined_text')
                      //       .map((e) => e.values.first.toString())
                      //       .firstOrNull;
                      //   if (dropDownValue == 'أخرى') {
                      return AppTextFormField(
                        withIcon: false,
                        onChanged: (value) {
                          ref
                              .read(cardsControllerProvider.notifier)
                              .addFieldValue(
                                fieldName: currentField.fieldName ?? '',
                                fieldValue: value,
                              );
                        },
                        isReadOnly: false,
                        hint: currentField.placeholder ?? '',
                        isRequired: currentField.isRequired ?? false,
                        validator: (currentField.isRequired ?? false)
                            ? (val) {
                                if (val == null || val.isEmpty) {
                                  return context.tr('required');
                                }
                                return null;
                              }
                            : (val) => null,
                        label: currentField.fieldLabel ?? '',
                        icon: Assets.icons.eventNameIc,
                      ).onlyPadding(bottom: 18);
                    }
                    return SizedBox.shrink();
                  }
                  return AppTextFormField(
                    withIcon: false,
                    onChanged: (value) {
                      ref.read(cardsControllerProvider.notifier).addFieldValue(
                            fieldName: currentField.fieldName ?? '',
                            fieldValue: value,
                          );
                    },
                    isReadOnly: false,
                    hint: currentField.placeholder ?? '',
                    isRequired: currentField.isRequired ?? false,
                    validator: (currentField.isRequired ?? false)
                        ? (val) {
                            if (val == null || val.isEmpty) {
                              return context.tr('required');
                            }
                            return null;
                          }
                        : (val) => null,
                    label: currentField.fieldLabel ?? '',
                    icon: Assets.icons.eventNameIc,
                  ).onlyPadding(bottom: 18);

                case 'Date':
                  return CustomizeCardDate(
                    key: ValueKey(date),
                    isRequired: currentField.isRequired ?? false,
                    hint: currentField.placeholder ?? '',
                    validator: (currentField.isRequired ?? false)
                        ? (val) {
                            if (val == null || val.isEmpty) {
                              return context.tr('required');
                            }
                            return null;
                          }
                        : null,
                    // date: DateTime.now().toString(),
                    date: date,
                    onSelectDate: (date) {
                      final formattedDate =
                          DateFormat('yyyy-MM-dd', 'en').format(date);
                      ref.read(cardsControllerProvider.notifier).addFieldValue(
                            fieldName: currentField.fieldName ?? '',
                            fieldValue: formattedDate,
                          );
                    },
                    title: currentField.fieldLabel ?? '',
                  ).onlyPadding(bottom: 18);

                case 'Time':
                  return CustomizeCardTime(
                    key: ValueKey(time),
                    isRequired: currentField.isRequired ?? false,
                    hint: currentField.placeholder ?? '',
                    validator: (currentField.isRequired ?? false)
                        ? (val) {
                            if (val == null || val.isEmpty) {
                              return context.tr('required');
                            }
                            return null;
                          }
                        : null,
                    dateTime: time,
                    onSelectTime: (time) {
                      final now = DateTime.now();
                      final dateTime = DateTime(
                          now.year, now.month, now.day, time.hour, time.minute);

                      final formattedTime =
                          DateFormat('HH:mm', 'en').format(dateTime);

                      ref.read(cardsControllerProvider.notifier).addFieldValue(
                            fieldName: currentField.fieldName ?? '',
                            fieldValue: formattedTime,
                          );
                    },
                    title: currentField.fieldLabel ?? '',
                  ).onlyPadding(bottom: 18);

                default:
                  return SizedBox();
              }
            },
            itemCount: widget.fields.length,
          ),

          18.verticalSpace,

          //? Confirm :
          CustomButtonWidget(
              text: 'preview',
              backgroundColor: AppColors.primary,
              color: AppColors.white,
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                if (key.currentState!.validate()) {
                  context.push(Routes.finalPreview, extra: widget.templateName);
                }
              },
              isFiled: true,
              height: 50,
              width: double.infinity)
        ],
      ),
    );
  }
}
