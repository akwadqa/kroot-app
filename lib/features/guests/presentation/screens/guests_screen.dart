import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/event/presentation/widgets/home_page/home_page_search_field.dart';
import 'package:kroot_app/features/guests/presentation/controller/guest_ui_controller.dart';
import 'package:kroot_app/features/guests/presentation/widgets/guests_list/add_guest_manual_bottom_sheet.dart';
import 'package:kroot_app/features/guests/presentation/widgets/guests_list/guests_screen_tab_bar.dart';
import 'package:kroot_app/features/guests/presentation/widgets/guests_list/update_guest_bottom_sheet.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/app_error_widget.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/app_toast.dart';

import '../controller/guests_controller.dart';

class GuestsScreen extends ConsumerStatefulWidget {
  final String id;
  const GuestsScreen({super.key, required this.id});

  @override
  ConsumerState<GuestsScreen> createState() => _GuestsScreenState();
}

class _GuestsScreenState extends ConsumerState<GuestsScreen> {
  @override
  void initState() {
    Future(() {
      ref.read(homeControllerProvider.notifier).getEventDetails(widget.id);
    });
    super.initState();
  }

  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => AddGuestManuallBotomSheet(),
    );
  }

  List<String?> rsvpStatusesFromIndex(int index) {
    switch (index) {
      case 0:
        return [];
      case 1:
        return ['Confirmed'];
      case 2:
        return ['Declined'];
      case 3:
        return ['Pending', 'Not Sent', null];
      case 4:
        return ['Failed'];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final index = ref.watch(guestUiControllerProvider).index;

    final controller = ref.watch(
      homeControllerProvider.select(
        (val) => val.value!.occasionModel ?? AsyncLoading(),
      ),
    );
    ref.listen(
      guestsControllerProvider.select((val) => val.value!.deleteGuestResponse),
      (prev, next) {
        if (next is AsyncLoading) {
          AppAlert.showLoadingDialog(context);
        }

        if (next is AsyncData) {
          context.pop();
          context.pop();
          ref.read(homeControllerProvider.notifier).getEventDetails(widget.id);
          AppToast.doneToast("successfullyCompleted".tr());
        }
        if (next is AsyncError) {
          context.pop();
          AppToast.errorToast(next.error.toString());
        }
      },
    );

    final event = ref.watch(homeControllerProvider).value!.occasionModel?.value;
    return Scaffold(
      appBar: CustomAppbar(
        title: context.tr('all_guests'),
        actionButton: event?.status == 'Draft'
            ? GestureDetector(
                onTap: () {
                  context.push(Routes.guestList, extra: event?.occasionId);
                },

                child: Assets.icons.addContactIc.svg(width: 30.w),
              )
            : null,
      ),
      body: Column(
        children: [
          HomePageSearchField(
            hint: context.tr('search'),
          ).symmetricPadding(horizontal: 22.w, vertical: 23.h),

          GuestsScreenTabBar(),

          controller.when(
            data: (data) {
              return Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: FadeTransition(opacity: animation, child: child),
                    );
                  },
                  child: KeyedSubtree(
                    key: ValueKey(index),
                    child: _buildBody(data, index),
                  ),
                ),
              );
            },
            error: (e, st) => AppErrorWidget(
              onTap: () {
                ref
                    .read(homeControllerProvider.notifier)
                    .getEventDetails(widget.id);
              },
            ),
            loading: () => Center(child: MailPulseAnimation()),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(EventModel event, int index) {
    final statuses = rsvpStatusesFromIndex(index);

    final filteredGuests = statuses.isEmpty
        ? event.guests
        : event.guests?.where((g) => statuses.contains(g.rsvpStatus)).toList();

    return filteredGuests?.isNotEmpty ?? false
        ? ListView.separated(
            separatorBuilder: (context, index) =>
                Divider(color: AppColors.lightGray02.withValues(alpha: .4)),
            itemBuilder: (context, index) => GuestsScreenGuestItem(
              index: index,
              guest: filteredGuests?[index],
              isConfirmed: event.status == 'Confirmed',
            ),
            itemCount: filteredGuests?.length ?? 0,
          )
        : Center(child: Assets.icons.emptyIc.svg());
  }
}

class GuestsScreenGuestItem extends ConsumerWidget {
  const GuestsScreenGuestItem({
    super.key,
    required this.index,
    required this.guest,
    required this.isConfirmed,
  });

  final int index;
  final bool isConfirmed;
  final GuestModel? guest;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(guestUiControllerProvider).index;

    return ListTile(
      onTap: !isConfirmed
          ? () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) =>
                    UpdateGuestNameBottomSheet(guestModel: guest!),
              );
            }
          : null,
      leading: !isConfirmed
          ? GestureDetector(
              onTap: () {
                AppAlert.showGlobalDialog(
                  context: context,
                  title: context.tr('deleteGuest'),
                  onSubmit: () {
                    ref
                        .read(guestsControllerProvider.notifier)
                        .deleteGuest(
                          guests: [guest!],
                          occasionId: ref
                              .read(homeControllerProvider)
                              .value!
                              .occasionModel!
                              .value!
                              .occasionId!,
                        );
                  },
                  text: Text.rich(
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
                          text: guest?.fullName,
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
                );
              },
              child: Assets.icons.xGuestIc.svg(),
            )
          : null,
      title: Text(
        guest?.fullName ?? '',
        style: AppTextStyle.rubikRegular16.copyWith(color: AppColors.black),
      ),
      trailing: tabIndex == 0
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: guest!.rsvpStatus == 'Confirmed'
                    ? AppColors.confirmGuest
                    : guest!.rsvpStatus == 'Pending' ||
                          guest!.rsvpStatus == 'Not Sent' ||
                          guest!.rsvpStatus == null
                    ? AppColors.waitingGuest
                    : guest!.rsvpStatus == 'Failed'
                    ? AppColors.black400
                    : AppColors.noticeRed,

                borderRadius: BorderRadius.circular(32.r),
              ),
              child: Text(
                guest!.rsvpStatus ?? 'Not Sent',
                style: AppTextStyle.rubikRegular14.copyWith(
                  color: AppColors.white,
                ),
              ),
            )
          : null,
    );
  }
}
