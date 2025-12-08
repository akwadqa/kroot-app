import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/event/presentation/controller/add_event/add_event_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/home_state.dart';
import 'package:kroot_app/features/event/presentation/controller/home_ui_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/update_event/update_event_controller.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';

class EditGuestBottomSheet extends ConsumerWidget {
  const EditGuestBottomSheet({
    super.key,

    required this.contact,
    required this.id,
  });
  final SelectedContact contact;
  final String? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(22.w),

      child: Wrap(
        children: [
          Column(
            children: [
              Row(
                children: [
                  //? Title :
                  Text(
                    context.tr('selectOption'),
                    style: AppTextStyle.rubikSemiBold20.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  Spacer(),
                  20.verticalSpace,

                  //? Close button :
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Assets.icons.closeIc.svg(),
                  ),
                ],
              ),

              // Spacer(),
              20.verticalSpace,
              //? Edit guest button :
              CustomButtonWidget(
                text: '',
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.icons.editContactIc.svg(),
                    10.horizontalSpace,
                    Text(
                      context.tr('editGuest'),
                      style: AppTextStyle.rubikSemiBold18.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                backgroundColor: AppColors.primary,
                onTap: () {
                  //? This to navigate to new bottom sheet :
                  ref
                      .read(homeUiControllerProvider.notifier)
                      .changeBottomIndex();
                },
                isFiled: true,
                height: 44.h,
                width: 330.h,
              ),
              20.verticalSpace,

              //? Delete guest button :
              CustomButtonWidget(
                text: '',
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.icons.deleteContactIc.svg(),
                    10.horizontalSpace,
                    Text(
                      context.tr('deleteGuest'),
                      style: AppTextStyle.rubikSemiBold18.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                boxDecoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: AppColors.primary.withValues(alpha: .25),
                    ),
                  ],
                ),
                backgroundColor: AppColors.white,
                onTap: () {
                  AppAlert.showGlobalDialog(
                    context: context,
                    title: context.tr('deleteGuest'),
                    onSubmit: () {
                      id == null
                          ? ref
                                .read(addEventControllerProvider.notifier)
                                .deleteSelectedContact(contact.contact)
                          : ref
                                .read(updateEventControllerProvider.notifier)
                                .deleteSelectedContact(contact.contact);
                      context.pop();
                      context.pop();
                    },

                    text: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: context.tr('sureRemoveContact1'),
                            style: AppTextStyle.rubikRegular14.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                          TextSpan(
                            text: contact.contact.displayName,
                            style: AppTextStyle.rubikMedium14.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                          TextSpan(
                            text: context.tr('sureRemoveContact2'),
                            style: AppTextStyle.rubikRegular14.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                isFiled: true,
                height: 44.h,
                width: 330.h,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
