import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/auth/presentation/widgets/create_account_page/create_account_field.dart';
import 'package:kroot_app/features/event/presentation/controller/add_event/add_event_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/update_event/update_event_controller.dart';
import 'package:kroot_app/features/event/presentation/widgets/guest_list_page/add_guest_number_filed.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class AddContactManuallBottomSheet extends StatefulWidget {
  const AddContactManuallBottomSheet({super.key, required this.id});

  final String? id;

  @override
  State<AddContactManuallBottomSheet> createState() =>
      _AddContactManuallBottomSheetState();
}

class _AddContactManuallBottomSheetState
    extends State<AddContactManuallBottomSheet> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController number;
  late TextEditingController code;
  FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    firstName = TextEditingController();
    lastName = TextEditingController();
    code = TextEditingController();
    number = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 700.h,
      padding: EdgeInsets.fromLTRB(
        22.w,
        22.w,
        22.w,
        MediaQuery.of(context).viewInsets.bottom + 22.w,
      ),
      child: KeyboardActions(   // 👈 wrap WHOLE card
                // tapOutsideToDismiss: true,

                config: KeyboardActionsConfig(
                  keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
                  actions: [
                    KeyboardActionsItem(
                      // displayActionBar: false,
                      focusNode: myFocusNode,
                      // toolbarButtons: [],
                      displayDoneButton: true,
                       
                    ),
                  ],
                ),
        child: Form(
          key: _key,
          child: SingleChildScrollView(
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      context.tr('addContact'),
                      style: AppTextStyle.rubikSemiBold20.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    Spacer(),
            
                    GestureDetector(
                      onTap: () {
                        if (FocusManager.instance.primaryFocus != null) {
                          FocusManager.instance.primaryFocus!.unfocus();
                        }
                        context.pop();
                      },
                      child: Assets.icons.closeIc.svg(),
                    ),
                  ],
                ),
                33.verticalSpace,
            
                AppTextFormField(
                  withIcon: false,
                  controller: firstName,
                  hint: context.tr('enterAnyFirstName'),
                  icon: Assets.icons.contactNameIc,
                  label: context.tr('firstName'),
                  isRequired: false,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return context.tr('required');
                    }
                    return null;
                  },
                ),
                20.verticalSpace,
            
                AppTextFormField(
                  withIcon: false,
                  controller: lastName,
                  hint: context.tr('enterAnyLastName'),
            
                  label: context.tr('lastName'),
                  isRequired: false,
                  validator: (val) {
                    return null;
                  },
                ),
                20.verticalSpace,
            
                Text(
                  context.tr('phone_number'),
                  style: AppTextStyle.rubikRegular18,
                ),
                12.verticalSpace,
            
                AddGuestNumberField(number,focusNode: myFocusNode,),
            
                20.verticalSpace,
                Consumer(
                  builder: (context, ref, child) {
                    final isLoading = ref.read(homeControllerProvider);
                    if (isLoading is AsyncLoading) {
                      return Center(child: MailPulseAnimation());
                    }
                    return CustomButtonWidget(
                      text: '',
                      onTap: () {
                        if (_key.currentState!.validate()) {
                          if (widget.id == null) {
                            if (FocusManager.instance.primaryFocus != null) {
                              FocusManager.instance.primaryFocus!.unfocus();
                            }
                            ref
                                .read(addEventControllerProvider.notifier)
                                .addNewContact(
                                  firstName: firstName.text,
                                  lastName: lastName.text,
                                  phoneNumber: number.text,
                                  code: code.text,
                                );
                          } else {
                            ref
                                .read(updateEventControllerProvider.notifier)
                                .addNewContact(
                                  firstName: firstName.text,
                                  lastName: lastName.text,
                                  phoneNumber: number.text,
                                  code: code.text,
                                );
                          }
                          context.pop();
                        }
                      },
                      isFiled: true,
                      boxDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(color: AppColors.primary, spreadRadius: 1),
                          BoxShadow(
                            color: AppColors.primary,
                            offset: Offset(0, 1),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      height: 44.h,
                      width: double.infinity,
                      backgroundColor: AppColors.primary,
                      content: Text(
                        context.tr('add'),
                        style: AppTextStyle.rubikSemiBold18.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    );
                  },
                ),
            
                31.verticalSpace,
                CustomButtonWidget(
                  text: '',
                  onTap: () {
                    if (FocusManager.instance.primaryFocus != null) {
                      FocusManager.instance.primaryFocus!.unfocus();
                    }
                    context.pop();
                  },
                  isFiled: false,
                  boxDecoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: .25),
                        blurRadius: 4,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  height: 44.h,
                  width: double.infinity,
                  backgroundColor: AppColors.white,
                  content: Text(
                    context.tr('cancel'),
                    style: AppTextStyle.rubikSemiBold18.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
