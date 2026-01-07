import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/auth/presentation/widgets/create_account_page/create_account_field.dart';
import 'package:kroot_app/features/event/presentation/controller/add_event/add_event_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/home_state.dart';
import 'package:kroot_app/features/event/presentation/controller/update_event/update_event_controller.dart';
import 'package:kroot_app/features/event/presentation/widgets/guest_list_page/add_guest_number_filed.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class EditGuestNameBottomSheet extends ConsumerStatefulWidget {
  const EditGuestNameBottomSheet({
    super.key,

    required this.contact,
    required this.id,
  });
  final SelectedContact contact;
  final String? id;

  @override
  ConsumerState<EditGuestNameBottomSheet> createState() =>
      _EditGuestNameBottomSheetState();
}

class _EditGuestNameBottomSheetState
    extends ConsumerState<EditGuestNameBottomSheet> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _codeController;
  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(
      text: widget.contact.contact.name.first,
    );
    _lastNameController = TextEditingController(
      text: widget.contact.contact.name.last,
    );
    _codeController = TextEditingController(
      text:
          '${widget.contact.code}${widget.contact.contact.phones.first.number}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        22.w,
        22.w,
        22.w,
        MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Wrap(
        children: [
          Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      context.tr('editGuest'),
                      style: AppTextStyle.rubikSemiBold20.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    Spacer(),

                    GestureDetector(
                      onTap: () => context.pop(),
                      child: Assets.icons.closeIc.svg(),
                    ),
                  ],
                ),
                31.verticalSpace,
                AppTextFormField(
                  withIcon: false,
                  controller: _firstNameController,
                  hint: context.tr('firstName'),
                  label: context.tr('firstName'),
                  isRequired: false,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return context.tr('required');
                    }
                    return null;
                  },
                ),
                18.verticalSpace,
                AppTextFormField(
                  withIcon: false,
                  controller: _lastNameController,
                  hint: context.tr('lastName'),
                  label: context.tr('lastName'),
                  isRequired: false,
                  validator: (val) => null,
                ),

                18.verticalSpace,
                Text('phone_number'.tr(), style: AppTextStyle.rubikRegular18),
                12.verticalSpace,
                AddGuestNumberField(_codeController),

                // AppTextFormField(
                //   withIcon: false,
                //   controller: _codeController,
                //   hint: context.tr('countryCode'),
                //   label: context.tr('countryCode'),
                //   isRequired: false,
                //   validator: (val) {
                //     if (val == null || val.isEmpty) {
                //       return context.tr('required');
                //     }
                //     return null;
                //   },
                // ),
                20.verticalSpace,
                CustomButtonWidget(
                  text: '',
                  content: Text(
                    context.tr('update'),
                    style: AppTextStyle.rubikSemiBold18.copyWith(
                      color: AppColors.white,
                    ),
                  ),

                  backgroundColor: AppColors.primary,
                  onTap: () {
                    if (_key.currentState!.validate()) {
                      widget.id == null
                          ? ref
                                .read(addEventControllerProvider.notifier)
                                .updateContactName(
                                  widget.contact.contact,
                                  _firstNameController.text,
                                  _lastNameController.text,
                                  _codeController.text,
                                  widget.contact.count,
                                )
                          : ref
                                .read(updateEventControllerProvider.notifier)
                                .updateContactName(
                                  widget.contact.contact,
                                  _firstNameController.text,
                                  _lastNameController.text,
                                  _codeController.text,
                                  widget.contact.count,
                                );
                      context.pop();
                    }
                  },
                  isFiled: true,
                  height: 44.h,
                  width: 330.h,
                ),
                11.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
