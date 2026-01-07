import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class EventDetailsPageDetailsSection extends StatelessWidget {
  const EventDetailsPageDetailsSection({super.key, required this.event});

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    final deviceLocale = Localizations.localeOf(context).toString();

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${DateFormat('EEE, dd MMM yyyy', deviceLocale).format(DateTime.parse(event.date ?? ''))} • ${DateFormat.jm(deviceLocale).format(DateTime.parse(event.date ?? ''))}',

                style: AppTextStyle.rubikRegular12.copyWith(
                  color: AppColors.blackText,
                ),
              ),
              Spacer(),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 11.w),
                decoration: BoxDecoration(
                  color: event.status == 'Confirmed'
                      ? AppColors.primary
                      : AppColors.gray,

                  borderRadius: BorderRadius.circular(32.r),
                ),
                child: Text(
                  event.status ?? '',
                  style: AppTextStyle.rubikRegular14.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
          5.verticalSpace,
          Text(
            event.title ?? '',
            style: AppTextStyle.rubikSemiBold16.copyWith(
              color: AppColors.primary,
            ),
          ),
          18.verticalSpace,

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Assets.icons.locationIc.svg(),
              5.horizontalSpace,
              Expanded(
                child: SizedBox(
                  child: Text(
                    softWrap: true,
                    overflow: TextOverflow.visible,

                    event.locationName ?? '',
                    style: AppTextStyle.rubikRegular12.copyWith(
                      color: AppColors.blackText,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ).symmetricPadding(horizontal: 22.w),
    );
  }
}
