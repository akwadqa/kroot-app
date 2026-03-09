import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/extenssions/int_extenssion.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';

class EventDetailsPageBottomSheet extends ConsumerWidget {
  final EventModel event;
  const EventDetailsPageBottomSheet({super.key, required this.event});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(22.w),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                context.tr('moreOptions'),
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
          33.verticalSpace,
          if (event.role == 'owner')
            ListTile(
              onTap: () {
                context.pop();
                context.push(Routes.manageAccess, extra: event.occasionId);
              },
              contentPadding: EdgeInsets.zero,
              leading: Assets.icons.manageAccessIc.svg(),
              title: Text(
                context.tr('manageAccess'),
                style: AppTextStyle.rubikMedium16.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          if (event.role == 'owner')
            Divider(color: AppColors.lightGray02, height: 0),
          if (event.status == 'Draft')
            ListTile(
              onTap: () {
                context.pop();

                context.push(Routes.updateEvent, extra: {'model': event});
              },
              contentPadding: EdgeInsets.zero,
              leading: Assets.icons.editEventIc.svg(),
              title: Text(
                context.tr('editEvent'),
                style: AppTextStyle.rubikMedium16.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          Divider(color: AppColors.lightGray02, height: 0),
          if (event.role == 'owner')
            ListTile(
              onTap: () {
                // context.pop();
                AppAlert.showGlobalDialog(
                  context: context,
                  title: context.tr('deleteEvent'),
                  text: Text(
                    context.tr('deleteEventAlert'),
                    style: AppTextStyle.rubikRegular14.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  onSubmit: () {
                    context.pop();
                    context.pop();
                    ref
                        .read(homeControllerProvider.notifier)
                        .deleteEvent(event.occasionId ?? '');
                  },
                );
              },
              contentPadding: EdgeInsets.zero,
              leading: Assets.icons.deleteEventIc.svg(),
              title: Text(
                context.tr('deleteEvent'),
                style: AppTextStyle.rubikMedium16.copyWith(
                  color: AppColors.noticeRed,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
