import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/event/domain/model/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/presentation/widgets/event_details_page/event_details_page_item_details.dart';
import 'package:kroot_app/features/guests/presentation/controller/guest_ui_controller.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/routing/routes.dart';

class EventDetailsPageReportGrid extends ConsumerWidget {
  const EventDetailsPageReportGrid({super.key, required this.event});

  final EventModel event;

  void _openGuestList(BuildContext context, WidgetRef ref, int tabIndex) {
    context.push(Routes.eventGuestList, extra: event.occasionId);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(guestUiControllerProvider.notifier).changIndex(tabIndex);
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 15.h,
        ),
        itemBuilder: (context, index) {
          final widgets = <Widget>[
            EventDetailsPageItemDetails(
              icon: Assets.icons.invitedIc,
              title: context.tr('invited'),
              onTap: () => _openGuestList(context, ref, 0),
              number: event.guestReport?.totalInvitees.toString() ?? '0',
            ),
            EventDetailsPageItemDetails(
              icon: Assets.icons.waitingIc,
              title: context.tr('waiting'),
              onTap: () => _openGuestList(context, ref, 3),
              number: event.guestReport?.pending.toString() ?? '0',
            ),
            EventDetailsPageItemDetails(
              icon: Assets.icons.messagesIc,
              title: context.tr('failed'),
              onTap: () => _openGuestList(context, ref, 4),
              number: event.guestReport?.failed.toString() ?? '0',
            ),
            EventDetailsPageItemDetails(
              icon: Assets.icons.confirmedIc,
              title: context.tr('status_confirmed'),
              onTap: () => _openGuestList(context, ref, 1),
              number: event.guestReport?.confirmed.toString() ?? '0',
            ),
            EventDetailsPageItemDetails(
              icon: Assets.icons.rejectedIc,
              title: context.tr('rejected'),
              onTap: () => _openGuestList(context, ref, 2),
              number: event.guestReport?.declined.toString() ?? '0',
            ),
            EventDetailsPageItemDetails(
              icon: Assets.icons.scannedIc,
              title: context.tr('scanned'),
              number: event.guestReport?.scannedCount.toString() ?? '0',
            ),
          ];

          return widgets[index];
        },
      ),
    );
  }
}
