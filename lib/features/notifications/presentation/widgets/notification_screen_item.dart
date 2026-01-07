import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kroot_app/features/notifications/domain/model/app_notifications_model.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/extenssions/int_extenssion.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class NotificationScreenItem extends StatelessWidget {
  const NotificationScreenItem({super.key, required this.notificationsModel});
  final AppNotificationsModel notificationsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(11),
      width: double.infinity,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColors.primary.withValues(alpha: .25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.h,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(7),
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.blueLight,
                ),
                child: Assets.icons.notificationsCartIc.svg(),
              ),
              10.horizontalSpace,
              Text(
                notificationsModel.appMessageTitle ?? '',
                style: AppTextStyle.rubikMedium14.copyWith(
                  color: AppColors.primary,
                ),
              ),
              Spacer(),
              Text(
                notificationsModel.publishedOn ?? '',
                style: AppTextStyle.rubikRegular11.copyWith(
                  color: AppColors.grayHint,
                ),
              ),
            ],
          ),

          Text(
            notificationsModel.content ?? '',
            style: AppTextStyle.rubikRegular12.copyWith(
              color: AppColors.blackText2,
            ),
          ),
        ],
      ),
    );
  }
}
