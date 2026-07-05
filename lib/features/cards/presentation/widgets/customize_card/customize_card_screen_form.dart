import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/auth/presentation/widgets/create_account_page/create_account_field.dart';
import 'package:kroot_app/features/cards/domain/template_field_model/template_field_model.dart';
import 'package:kroot_app/features/cards/presentation/controller/cards_controller.dart';
import 'package:kroot_app/features/event/presentation/widgets/create_event_page/create_event_page_select_language_field.dart';
import 'package:kroot_app/features/event/presentation/widgets/create_event_page/event_details_date.dart';
import 'package:kroot_app/features/event/presentation/widgets/create_event_page/event_details_time.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class CustomizeCardScreenForm extends ConsumerStatefulWidget {
  const CustomizeCardScreenForm({
    super.key,
    required this.fields,
  });
  final List<TemplateFieldModel> fields;

  @override
  ConsumerState<CustomizeCardScreenForm> createState() =>
      _CustomizeCardScreenFormState();
}

class _CustomizeCardScreenFormState
    extends ConsumerState<CustomizeCardScreenForm> {
  late TextEditingController _title;
  late TextEditingController _location;

  @override
  void initState() {
    super.initState();
    _title = TextEditingController();
    _location = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _title.dispose();
    _location.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();

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
            separatorBuilder: (context, index) => 18.verticalSpace,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final currentField = widget.fields[index];
              switch (currentField.fieldType) {
                case 'Text':
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
                        : null,
                    label: currentField.fieldLabel ?? '',
                    icon: Assets.icons.eventNameIc,
                  );

                case 'Date':
                  return EventDetailsDate(
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
                    date: ref
                        .watch(cardsControllerProvider)
                        .value!
                        .fieldsValues
                        .where((element) =>
                            element.keys.first == currentField.fieldName)
                        .map((e) => e.values.first.toString())
                        .firstOrNull
                        ?.toString(),
                    onSelectDate: (date) {
                      final formattedDate =
                          DateFormat('yyyy-MM-dd', 'en').format(date);
                      ref.read(cardsControllerProvider.notifier).addFieldValue(
                            fieldName: currentField.fieldName ?? '',
                            fieldValue: formattedDate,
                          );
                    },
                    title: currentField.fieldLabel ?? '',
                  );

                case 'Time':
                  return EventDetailsTime(
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
                    dateTime: ref
                        .watch(cardsControllerProvider)
                        .value!
                        .fieldsValues
                        .where((element) =>
                            element.keys.first == currentField.fieldName)
                        .map((e) => e.values.first.toString())
                        .firstOrNull
                        ?.toString(),
                    onSelectTime: (time) {
                      log(time.format(context).toString());
                      ref.read(cardsControllerProvider.notifier).addFieldValue(
                            fieldName: currentField.fieldName ?? '',
                            fieldValue: time.format(context),
                          );
                    },
                    title: currentField.fieldLabel ?? '',
                  );

                default:
                  return SizedBox();
              }
            },
            itemCount: widget.fields.length,
          ),
          // AppTextFormField(
          //   withIcon: false,
          //   controller: _title,
          //   isReadOnly: false,
          //   hint: context.tr('name'),
          //   isRequired: false,
          //   validator: (val) {
          //     if (val == null || val.isEmpty) {
          //       return context.tr('required');
          //     }
          //     return null;
          //   },
          //   label: context.tr('name'),
          //   icon: Assets.icons.eventNameIc,
          // ),
          // 18.verticalSpace,

          // //? Time :
          // EventDetailsTime(
          //   dateTime: DateTime.now(),
          //   onSelectTime: (time) {},
          //   title: context.tr('time'),
          // ),
          // 18.verticalSpace,

          // //? Date :
          // EventDetailsDate(
          //   date: DateTime.now().toString(),
          //   onSelectDate: (date) {},
          //   title: context.tr('date'),
          // ),
          // 18.verticalSpace,

          // //? Location :
          // AppTextFormField(
          //   withIcon: true,
          //   controller: _location,
          //   isReadOnly: false,
          //   hint: context.tr('enter_location'),
          //   isRequired: false,
          //   validator: (val) {
          //     if (val == null || val.isEmpty) {
          //       return context.tr('required');
          //     }
          //     return null;
          //   },
          //   label: context.tr('location'),
          //   icon: Assets.icons.cardLocationIc,
          // ),
          // 18.verticalSpace,

          // //? Other drop downs :
          // CreateEventPageSelectLanguageField(
          //   items: ['1', '2', '3']
          //       .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          //       .toList(),
          //   value: '1',
          //   onChanged: (val) {},
          //   title: "title",
          // ),
          18.verticalSpace,

          //? Confirm :
          CustomButtonWidget(
              text: 'preview',
              backgroundColor: AppColors.primary,
              color: AppColors.white,
              onTap: () {
                if (key.currentState!.validate()) {
                  context.push(Routes.finalPreview);
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
