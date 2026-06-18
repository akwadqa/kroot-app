import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/auth/presentation/widgets/create_account_page/create_account_field.dart';
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
  });

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //? Title :
        Text(
          'enter_details_below'.tr(),
          style: AppTextStyle.rubikMedium18.copyWith(color: AppColors.primary),
        ),
        20.verticalSpace,
        AppTextFormField(
          withIcon: false,
          controller: _title,
          isReadOnly: false,
          hint: context.tr('name'),
          isRequired: false,
          validator: (val) {
            if (val == null || val.isEmpty) {
              return context.tr('required');
            }
            return null;
          },
          label: context.tr('name'),
          icon: Assets.icons.eventNameIc,
        ),
        18.verticalSpace,

        //? Time :
        EventDetailsTime(
          dateTime: DateTime.now(),
          onSelectTime: (time) {},
          title: context.tr('time'),
        ),
        18.verticalSpace,

        //? Date :
        EventDetailsDate(
          date: DateTime.now().toString(),
          onSelectDate: (date) {},
          title: context.tr('date'),
        ),
        18.verticalSpace,

        //? Location :
        AppTextFormField(
          withIcon: true,
          controller: _location,
          isReadOnly: false,
          hint: context.tr('enter_location'),
          isRequired: false,
          validator: (val) {
            if (val == null || val.isEmpty) {
              return context.tr('required');
            }
            return null;
          },
          label: context.tr('location'),
          icon: Assets.icons.cardLocationIc,
        ),
        18.verticalSpace,

        //? Other drop downs :
        CreateEventPageSelectLanguageField(
          items: ['1', '2', '3']
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          value: '1',
          onChanged: (val) {},
          title: "title",
        ),
        18.verticalSpace,

        //? Confirm :
        CustomButtonWidget(
            text: 'preview',
            backgroundColor: AppColors.primary,
            color: AppColors.white,
            onTap: () => context.push(Routes.finalPreview),
            isFiled: true,
            height: 50,
            width: double.infinity)
      ],
    );
  }
}
