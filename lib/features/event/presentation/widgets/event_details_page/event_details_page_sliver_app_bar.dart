import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/presentation/widgets/event_details_page/event_details_page_back_button.dart';
import 'package:kroot_app/features/event/presentation/widgets/event_details_page/event_details_page_flexible_space.dart';
import 'package:kroot_app/features/event/presentation/widgets/event_details_page/event_details_page_options_button.dart';
import 'package:kroot_app/src/theme/app_colors.dart';

class EventDetailsPageSliverAppBar extends StatelessWidget {
  const EventDetailsPageSliverAppBar({
    super.key,
    required this.controller,
    required this.eventModel,
    required this.expandedH,
    required this.resolvedUrl,
  });

  final AsyncValue<EventModel>? controller;
  final EventModel? eventModel;
  final double expandedH;
  final String? resolvedUrl;

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';

    return SliverAppBar(
      pinned: true,
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      title: const SizedBox.shrink(),
      leadingWidth: 74.w,
      leading: isArabic
          ? EventDetailsPageOptionsButton(
              controller: controller!,
              eventModel: eventModel,
            )
          : const EventDetailsPageBackButton(),
      actions: [
        isArabic
            ? const EventDetailsPageBackButton()
            : EventDetailsPageOptionsButton(
                controller: controller!,
                eventModel: eventModel,
              ),
      ],
      expandedHeight: expandedH,
      flexibleSpace: EventDetailsPageFlexibleSpace(
        expandedH: expandedH,
        resolvedUrl: resolvedUrl,
        title: controller?.value?.title ?? '',
      ),
    );
  }
}
