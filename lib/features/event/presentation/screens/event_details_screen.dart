import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/event/presentation/widgets/event_details_page/event_details_page_bottom_sheet.dart';
import 'package:kroot_app/features/event/presentation/widgets/event_details_page/event_details_page_details_section.dart';
import 'package:kroot_app/features/event/presentation/widgets/event_details_page/event_details_page_item_details.dart';
import 'package:kroot_app/features/guests/presentation/controller/guest_ui_controller.dart';

import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/extenssions/int_extenssion.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/app_error_widget.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/app_toast.dart';

class EventDetailsScreen extends ConsumerStatefulWidget {
  const EventDetailsScreen({
    super.key,

    required this.eventModel,
    required this.id,
  });
  final String? id;
  final EventModel? eventModel;

  @override
  ConsumerState<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends ConsumerState<EventDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Future(() {
      if (widget.eventModel == null) {
        ref.read(homeControllerProvider.notifier).getEventDetails(widget.id!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final image = ref.watch(
      homeControllerProvider.select(
        (val) => val.value?.occasionModel?.value?.imageUrl,
      ),
    );
    final controller = ref.watch(
      homeControllerProvider.select((val) => val.value!.occasionModel),
    );

    ref.listen(homeControllerProvider, (pre, next) {
      if (next.value?.isDeleteEvent != null) {
        if (next is AsyncLoading) {
          Future.delayed(Duration(milliseconds: 300), () {
            AppAlert.showLoadingDialog(
              Navigator.of(context, rootNavigator: true).context,
            );
          });
        }

        if (next is AsyncData && pre is AsyncLoading) {
          Navigator.of(context, rootNavigator: true).pop();

          AppToast.doneToast('Your event deleted successfuly!');
          context.pushReplacement(Routes.main);
          ref.read(homeControllerProvider.notifier).getUserEvents(page: 1);
        }

        if (next is AsyncError) {
          Navigator.of(context, rootNavigator: true).pop();
          AppToast.errorToast(next.error.toString());
        }
      }
    });

    String? resolveImageUrl(String? imagePath) {
      final baseUrl = dotenv.env['BASE_IMAGE'] ?? '';
      if (imagePath == null || imagePath.isEmpty) return null;
      if (imagePath.startsWith('http')) return imagePath;
      final base = baseUrl.endsWith('/') ? baseUrl : '$baseUrl/';
      final path = imagePath.startsWith('/')
          ? imagePath.substring(1)
          : imagePath;
      return '$base$path';
    }

    final double expandedH = (image != null && image.isNotEmpty) ? 213.h : 0;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (context.canPop()) {
          context.pop();
        } else {
          context.go(Routes.main);
        }
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: AppColors.white,
              surfaceTintColor: AppColors.white,
              title: const SizedBox.shrink(),

              leadingWidth: 74.w,
              leading: context.locale.languageCode == 'ar'
                  ? controller!.maybeWhen(
                      orElse: () => const SizedBox.shrink(),
                      data: (data) {
                        if (data.role == 'owner' ||
                            data.role == 'handler_edit') {
                          return Padding(
                            padding: EdgeInsets.only(right: 22.w, left: 22.w),
                            child: GestureDetector(
                              onTap: () => _buildBottomSheet(
                                context,
                                widget.eventModel ?? data,
                              ),
                              child: Assets.icons.optionsIc.svg(width: 30.w),
                            ),
                          );
                        }
                        return SizedBox.shrink();
                      },
                    )
                  : _backButton(context),
              actions: [
                context.locale.languageCode == 'ar'
                    ? _backButton(context)
                    : controller!.maybeWhen(
                        orElse: () => const SizedBox.shrink(),
                        data: (data) {
                          if (data.role == 'owner' ||
                              data.role == 'handler_edit') {
                            return Padding(
                              padding: EdgeInsets.only(right: 22.w, left: 22.w),
                              child: GestureDetector(
                                onTap: () => _buildBottomSheet(
                                  context,
                                  widget.eventModel ?? data,
                                ),
                                child: Assets.icons.optionsIc.svg(width: 30.w),
                              ),
                            );
                          }
                          return SizedBox.shrink();
                        },
                      ),
              ],

              expandedHeight: expandedH,

              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  final double top = constraints.biggest.height;

                  final double collapsedH =
                      kToolbarHeight + MediaQuery.of(context).padding.top;

                  final double t = (expandedH <= 0)
                      ? 0
                      : ((top - collapsedH) / (expandedH - collapsedH)).clamp(
                          0.0,
                          1.0,
                        );

                  final bool showTitle = t <= 0.02;

                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(color: AppColors.white),

                      if (resolveImageUrl(image) != null)
                        Opacity(
                          opacity: t,
                          child: CachedNetworkImage(
                            fadeInCurve: Curves.linear,
                            placeholder: (context, url) =>
                                FadeCircleLoadingIndicator(),
                            imageUrl: resolveImageUrl(image) ?? '',
                            fit: BoxFit.cover,
                          ),
                        ),

                      IgnorePointer(
                        ignoring: true,
                        child: Container(
                          color: AppColors.white.withOpacity((1 - t) * 0.10),
                        ),
                      ),

                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: SafeArea(
                          bottom: false,
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(
                              start: 72.w,
                              end: 22.w,
                              bottom: 12.h,
                            ),
                            child: AnimatedOpacity(
                              opacity: showTitle ? 1 : 0,
                              duration: const Duration(milliseconds: 180),
                              curve: Curves.easeOut,
                              child: Text(
                                controller?.value?.title ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyle.rubikMedium20.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            controller!.when(
              data: (event) => _buildBody(context, event, ref),
              error: (e, st) => SliverToBoxAdapter(
                child: AppErrorWidget(
                  onTap: () {
                    ref
                        .read(homeControllerProvider.notifier)
                        .getEventDetails(widget.id!);
                  },
                ),
              ),
              loading: () => SliverFillRemaining(
                child: Center(child: MailPulseAnimation()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _backButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 22.w,
        right: context.locale.languageCode == 'ar' ? 0 : 22.w,
      ),
      child: GestureDetector(
        onTap: () {
          if (context.canPop()) {
            context.pop();
          } else {
            context.go(Routes.main);
          }
        },
        child: Assets.icons.verificationArrowBackIc.svg(
          width: context.locale.languageCode == 'ar' ? 30.w : null,
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, EventModel event, WidgetRef ref) {
    return SliverList(
      delegate: SliverChildListDelegate([
        20.verticalSpace,

        EventDetailsPageDetailsSection(event: event),
        20.verticalSpace,
        Divider(color: AppColors.grayBorder),
        20.verticalSpace,

        Text(
          context.tr('invitationReport'),
          style: AppTextStyle.nunitoSemibold16.copyWith(
            color: AppColors.primary,
          ),
        ).onlyPadding(start: 22.w, bottom: 12.h),

        Text(
          context.tr('inviteReportHere'),
          style: AppTextStyle.rubikRegular14.copyWith(
            color: AppColors.blackText,
          ),
        ).onlyPadding(start: 22.w, bottom: 20.h),

        Padding(
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
                  onTap: () {
                    context.push(
                      Routes.eventGuestList,
                      extra: event.occasionId,
                    );
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ref
                          .read(guestUiControllerProvider.notifier)
                          .changIndex(0);
                    });
                  },
                  number: event.guestReport?.totalInvitees.toString() ?? '0',
                ),
                EventDetailsPageItemDetails(
                  icon: Assets.icons.waitingIc,
                  title: context.tr('waiting'),
                  onTap: () {
                    context.push(
                      Routes.eventGuestList,
                      extra: event.occasionId,
                    );
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ref
                          .read(guestUiControllerProvider.notifier)
                          .changIndex(3);
                    });
                  },
                  number: event.guestReport?.pending.toString() ?? '0',
                ),
                EventDetailsPageItemDetails(
                  icon: Assets.icons.messagesIc,
                  title: context.tr('failed'),
                  onTap: () {
                    context.push(
                      Routes.eventGuestList,
                      extra: event.occasionId,
                    );
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ref
                          .read(guestUiControllerProvider.notifier)
                          .changIndex(4);
                    });
                  },
                  number: event.guestReport?.failed.toString() ?? '0',
                ),
                EventDetailsPageItemDetails(
                  icon: Assets.icons.confirmedIc,
                  title: context.tr('status_confirmed'),
                  onTap: () {
                    context.push(
                      Routes.eventGuestList,
                      extra: event.occasionId,
                    );
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ref
                          .read(guestUiControllerProvider.notifier)
                          .changIndex(1);
                    });
                  },
                  number: event.guestReport?.confirmed.toString() ?? '0',
                ),
                EventDetailsPageItemDetails(
                  icon: Assets.icons.rejectedIc,
                  title: context.tr('rejected'),
                  onTap: () {
                    context.push(
                      Routes.eventGuestList,
                      extra: event.occasionId,
                    );
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ref
                          .read(guestUiControllerProvider.notifier)
                          .changIndex(2);
                    });
                  },
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
        ),

        20.verticalSpace,

        if ((widget.eventModel?.status == 'Draft' || event.status == 'Draft') &&
            event.role == 'owner')
          CustomButtonWidget(
            text: '',
            onTap: () {
              context.push(
                Routes.sendInvite,
                extra: widget.eventModel ?? event,
              );
            },
            isFiled: true,
            content: Text(
              context.tr('confirmEvent'),
              style: AppTextStyle.nunitoBold16.copyWith(color: AppColors.white),
            ),
            height: 44.h,
            width: 330.w,
            backgroundColor: AppColors.primary,
          ).symmetricPadding(horizontal: 22.w),

        if (widget.eventModel?.status == 'Draft' || event.status == 'Draft')
          20.verticalSpace,

        if ((widget.eventModel?.status == 'Draft' || event.status == 'Draft') &&
            event.role != 'operator')
          CustomButtonWidget(
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
              style: AppTextStyle.nunitoBold16.copyWith(
                color: AppColors.primary,
              ),
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
          ).symmetricPadding(horizontal: 22.w),
        40.verticalSpace,
      ]),
    );
  }

  Future<dynamic> _buildBottomSheet(BuildContext context, EventModel event) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => EventDetailsPageBottomSheet(event: event),
    );
  }
}
