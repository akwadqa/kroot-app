import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/auth/presentation/widgets/create_account_page/create_account_field.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/guests/presentation/controller/guests_controller.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/app_toast.dart';

class AddGuestManuallBotomSheet extends ConsumerStatefulWidget {
  const AddGuestManuallBotomSheet({super.key});

  @override
  ConsumerState<AddGuestManuallBotomSheet> createState() =>
      _AddGuestManuallBotomSheetState();
}

class _AddGuestManuallBotomSheetState
    extends ConsumerState<AddGuestManuallBotomSheet> {
  late TextEditingController firstName, lastName, number;
  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    firstName = TextEditingController();
    lastName = TextEditingController();
    number = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      guestsControllerProvider.select((val) => val.value!.addGuestsResponse),
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
      height: 700.h,
      padding: EdgeInsets.all(22.w),
      child: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  //? Title :
                  Text(
                    context.tr('addGuest'),
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
              33.verticalSpace,

              //? First name :
              AppTextFormField(
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

              //? Last name :
              AppTextFormField(
                controller: lastName,
                hint: context.tr('enterAnyLastName'),
                icon: Assets.icons.contactNameIc,
                label: context.tr('lastName'),
                isRequired: false,
                validator: (val) {
                  return null;
                
                  //TODO
                  // if (val == null || val.isEmpty) {
                  //   return context.tr('required');
                  // }
                },
              ),
              20.verticalSpace,

              //? number :
              AppTextFormField(
                controller: number,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return context.tr('required');
                  }
                  return null;
                },
                inputType: TextInputType.number,
                hint: context.tr('enterPhone'),
                icon: Assets.icons.contactNumberIc,
                label: context.tr('phone_number'),
                isRequired: false,
              ),
              120.verticalSpace,
              Consumer(
                builder: (context, ref, child) {
                  final isLoading = ref.read(homeControllerProvider);
                  if (isLoading is AsyncLoading) {
                    return Center(
                      child: Assets.images.animationLoading.image(
                        color: AppColors.primary,
                      ),
                    );
                  }
                  return CustomButtonWidget(
                    text: '',
                    onTap: () {
                      if (_key.currentState!.validate()) {
                        // context.pop();
                        ref
                            .read(guestsControllerProvider.notifier)
                            // TODO : Edit occasionId here :
                            .addGuest(
                              guest: GuestModel(
                                firstName: firstName.text,
                                lastName: lastName.text,
                                whatsappNumber: number.text,
                              ),
                              occasionId:
                                  ref
                                      .read(homeControllerProvider)
                                      .value!
                                      .occasionModel
                                      ?.value
                                      ?.occasionId ??
                                  '',
                            );
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

              //? Add button:
              31.verticalSpace,
              CustomButtonWidget(
                text: '',
                onTap: () {
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
    );
  }
}
