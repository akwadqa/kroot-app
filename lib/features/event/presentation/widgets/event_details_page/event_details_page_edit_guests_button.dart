import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class EventDetailsPageEditGuestsButton extends ConsumerWidget {
  const EventDetailsPageEditGuestsButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomButtonWidget(
      text: '',
      onTap: () {
        context.push(
          Routes.guestList,
          extra: ref
              .read(homeControllerProvider)
              .value!
              .occasionModel!
              .value!
              .occasionId,
        );
      },
      isFiled: true,
      content: Text(
        context.tr('editGuestList'),
        style: AppTextStyle.nunitoBold16.copyWith(color: AppColors.primary),
      ),
      boxDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: AppColors.primary.withValues(alpha: .25),
          ),
        ],
      ),
      height: 44.h,
      width: 330.w,
      backgroundColor: AppColors.white,
    ).symmetricPadding(horizontal: 22.w);
  }
}
