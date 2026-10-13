import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kroot_app/features/event/domain/model/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/presentation/widgets/event_details_page/event_details_page_bottom_sheet.dart';
import 'package:kroot_app/gen/assets.gen.dart';

class EventDetailsPageOptionsButton extends StatelessWidget {
  const EventDetailsPageOptionsButton({
    super.key,
    required this.controller,
    required this.eventModel,
  });

  final AsyncValue<EventModel> controller;
  final EventModel? eventModel;

  @override
  Widget build(BuildContext context) {
    return controller.maybeWhen(
      orElse: () => const SizedBox.shrink(),
      data: (data) {
        if (data.role == 'owner' || data.role == 'handler_edit') {
          return Padding(
            padding: EdgeInsets.only(right: 22.w, left: 22.w),
            child: GestureDetector(
              onTap: () => _showBottomSheet(context, eventModel ?? data),
              child: Assets.icons.optionsIc.svg(width: 30.w),
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }

  Future<dynamic> _showBottomSheet(BuildContext context, EventModel event) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => EventDetailsPageBottomSheet(event: event),
    );
  }
}
