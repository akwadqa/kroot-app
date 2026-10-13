import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kroot_app/features/event/domain/model/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/event/presentation/widgets/event_details_page/event_details_page_confirm_button.dart';
import 'package:kroot_app/features/event/presentation/widgets/event_details_page/event_details_page_details_section.dart';
import 'package:kroot_app/features/event/presentation/widgets/event_details_page/event_details_page_edit_guests_button.dart';
import 'package:kroot_app/features/event/presentation/widgets/event_details_page/event_details_page_report_grid.dart';
import 'package:kroot_app/features/event/presentation/widgets/event_details_page/event_details_page_report_header.dart';
import 'package:kroot_app/features/event/presentation/widgets/event_details_page/event_details_page_resend_button.dart';
import 'package:kroot_app/src/theme/app_colors.dart';

class EventDetailsPageBody extends ConsumerWidget {
  const EventDetailsPageBody({
    super.key,
    required this.event,
    required this.eventModel,
  });

  final EventModel event;
  final EventModel? eventModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isReview = ref.watch(
      homeControllerProvider.select(
        (val) => val.value?.utilsResponse?.value?.appleReview,
      ),
    );

    final isFailed =
        event.guestReport?.failed != null && event.guestReport!.failed! > 0;

    return SliverList(
      delegate: SliverChildListDelegate([
        20.verticalSpace,
        EventDetailsPageDetailsSection(event: event),
        20.verticalSpace,
        Divider(color: AppColors.grayBorder),
        20.verticalSpace,
        const EventDetailsPageReportHeader(),
        EventDetailsPageReportGrid(event: event),
        20.verticalSpace,
        if (event.status != 'Confirmed' && event.role == 'owner')
          EventDetailsPageConfirmButton(event: event, eventModel: eventModel),
        20.verticalSpace,
        if (event.role != 'operator' && isReview != 1)
          const EventDetailsPageEditGuestsButton(),
        if (event.role != 'operator' && isFailed && isReview != 1)
          20.verticalSpace,
        if (event.role != 'operator' && isFailed && isReview != 1)
          EventDetailsPageResendButton(occasionId: event.occasionId),
        40.verticalSpace,
      ]),
    );
  }
}
