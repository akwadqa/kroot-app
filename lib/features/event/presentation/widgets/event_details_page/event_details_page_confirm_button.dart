import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class EventDetailsPageConfirmButton extends StatelessWidget {
  const EventDetailsPageConfirmButton({
    super.key,
    required this.event,
    required this.eventModel,
  });

  final EventModel event;
  final EventModel? eventModel;

  @override
  Widget build(BuildContext context) {
    return CustomButtonWidget(
      text: '',
      onTap: () {
        context.push(Routes.sendInvite, extra: eventModel ?? event);
      },
      isFiled: true,
      content: Text(
        event.status == 'Draft'
            ? context.tr('confirmEvent')
            : context.tr('reConfirm'),
        style: AppTextStyle.nunitoBold16.copyWith(color: AppColors.white),
      ),
      height: 44.h,
      width: 330.w,
      backgroundColor: AppColors.primary,
    ).symmetricPadding(horizontal: 22.w);
  }
}
