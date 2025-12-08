import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/auth/presentation/widgets/create_account_page/create_account_field.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/guests/presentation/controller/guests_controller.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/app_toast.dart';

class UpdateGuestNameBottomSheet extends ConsumerStatefulWidget {
  const UpdateGuestNameBottomSheet({super.key, required this.guestModel});
  final GuestModel guestModel;

  @override
  ConsumerState<UpdateGuestNameBottomSheet> createState() =>
      _UpdateGuestNameBottomSheetState();
}

class _UpdateGuestNameBottomSheetState
    extends ConsumerState<UpdateGuestNameBottomSheet> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: '');
    _lastNameController = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      guestsControllerProvider.select((val) => val.value!.updateGuestResponse),
      (prev, next) {
        if (next is AsyncLoading) {
          AppAlert.showLoadingDialog(context);
        }

        if (next is AsyncData) {
          context.pop();
          context.pop();
          AppToast.doneToast('Done');
        }
        if (next is AsyncError) {
          context.pop();
          AppToast.errorToast(next!.error!.toString());
        }
      },
    );
    return Container(
      // padding: EdgeInsets.all(22.w),
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
              children: [
                Row(
                  children: [
                    //? Title :p
                    Text(
                      context.tr('editGuest'),
                      style: AppTextStyle.rubikSemiBold20.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    Spacer(),

                    //? Close button :
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: Assets.icons.closeIc.svg(),
                    ),
                  ],
                ),
                31.verticalSpace,
                // AppTextFormField(
                //   withIcon: false,
                //   controller: _firstNameController,
                //   hint: context.tr('firstName'),
                //   label: context.tr('firstName'),
                //   isRequired: false,
                // validator: (val) {
                //   if (val == null || val.isEmpty) {
                //     return context.tr('required');
                //   }
                // },
                // ),
                AppTextFormField(
                  withIcon: false,
                  controller: _lastNameController,
                  hint: context.tr('phone'),
                  label: context.tr('phone'),
                  isRequired: false,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return context.tr('required');
                    }
                    return null;
                  },
                ),
                // Spacer(),
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
                      // context.pop();
                      ref
                          .read(guestsControllerProvider.notifier)
                          .updateGuest(
                            // TODO : Dont forget to add inviteeId here :
                            inviteeId: widget.guestModel.inviteeId!,
                            whatsappNumber: _lastNameController.text,
                          );
                    }
                  },
                  isFiled: true,
                  height: 44.h,
                  width: 330.h,
                ),
                11.verticalSpace,
                18.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
