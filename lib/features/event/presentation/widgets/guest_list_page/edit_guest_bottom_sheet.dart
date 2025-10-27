import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_app/features/event/presentation/controller/home_controller.dart';
import 'package:wedding_app/features/event/presentation/controller/home_state.dart';
import 'package:wedding_app/features/event/presentation/controller/home_ui_controller.dart';
import 'package:wedding_app/gen/assets.gen.dart';
import 'package:wedding_app/src/shared_widgets/custom_button_widget.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';

class EditGuestBottomSheet extends ConsumerWidget {
  const EditGuestBottomSheet({super.key, required this.contact});
  final SelectedContact contact;

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
                  _showDeleteGuestDialog(context, ref);
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

  Future<dynamic> _showDeleteGuestDialog(BuildContext context, WidgetRef ref) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          width: 330.w,
          height: 297.h,
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //? Title :
              Text(
                context.tr('deleteGuest'),
                style: AppTextStyle.rubikSemiBold18.copyWith(
                  color: AppColors.primary,
                ),
              ),
              20.verticalSpace,

              //? Text :
              Text.rich(
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
              20.verticalSpace,

              //? Sure for delete :
              CustomButtonWidget(
                text: '',
                content: Text(
                  context.tr('yesDelete'),
                  style: AppTextStyle.rubikSemiBold18.copyWith(
                    color: AppColors.white,
                  ),
                ),
                backgroundColor: AppColors.primary,
                onTap: () {
                  ref
                      .read(homeControllerProvider.notifier)
                      .deleteSelectedContact(contact.contact);
                  context.pop();
                  context.pop();
                },
                isFiled: true,
                height: 44.h,
                width: double.infinity,
              ),
              20.verticalSpace,

              //? Cancel :
              CustomButtonWidget(
                text: '',
                content: Text(
                  context.tr('cancel'),
                  style: AppTextStyle.rubikSemiBold18.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                backgroundColor: AppColors.white,
                onTap: () {
                  context.pop();
                },
                isFiled: true,
                height: 44.h,
                boxDecoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: AppColors.primary.withValues(alpha: .25),
                    ),
                  ],
                ),
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
