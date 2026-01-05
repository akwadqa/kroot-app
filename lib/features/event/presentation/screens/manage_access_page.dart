import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/event/data/data.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/presentation/controller/add_event/add_event_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/update_event/update_event_controller.dart';
import 'package:kroot_app/features/event/presentation/widgets/manage_access_page/add_operator_handler_bottom_sheet.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/app_toast.dart';

class ManageAccessPage extends ConsumerStatefulWidget {
  const ManageAccessPage(this.id, {super.key});
  final String? id;

  @override
  ConsumerState<ManageAccessPage> createState() => _ManageAccessPageState();
}

class _ManageAccessPageState extends ConsumerState<ManageAccessPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      updateEventControllerProvider.select(
        (val) => val.value!.updateHandlersResponse,
      ),
      (prev, next) {
        if (prev == next) return;
        if (next is AsyncLoading) {
          AppAlert.showLoadingDialog(context);
        }

        if (next is AsyncData) {
          context.pop();
          // context.go(Routes.eventDetails, extra: {'model': eventModel});
          // context.go(Routes.eventDetails, extra: {'id': widget.id});
          context.pop();
          context.pop();
          AppToast.doneToast("successfullyCompleted".tr());
          ref.read(homeControllerProvider.notifier).getEventDetails(widget.id!);
        }
        if (next is AsyncError) {
          context.pop();
          AppToast.errorToast(next!.error.toString());
        }
      },
    );

    ref.listen(
      updateEventControllerProvider.select(
        (val) => val.value!.deleteHandlersResponse,
      ),
      (previous, next) {
        if (next is AsyncLoading) {
          AppAlert.showLoadingDialog(context);
        } else {
          context.pop();
        }
      },
    );
    final isConfirmed = widget.id == null
        ? false
        : ref
                  .read(homeControllerProvider)
                  .value!
                  .occasionModel!
                  .value!
                  .status ==
              'Confirmed';

    return Scaffold(
      appBar: CustomAppbar(title: context.tr('manageAccess')),
      body: Column(
        children: [
          30.verticalSpace,
          Container(
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: AppColors.black.withValues(alpha: .25),
                ),
              ],
            ),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              // dividerHeight: 3.h,
              indicatorWeight: 3.h,
              indicatorColor: AppColors.primary,
              dividerColor: Colors.transparent,
              controller: controller,
              tabs: [
                Text(
                  context.tr('operator'),
                  style: AppTextStyle.rubikMedium18.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  context.tr('authorized'),
                  style: AppTextStyle.rubikMedium18.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: [_buildOperatorSecton(), _buildHandlerSection(context)],
            ),
          ),
          if (!isConfirmed)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: CustomButtonWidget(
                text: '',
                backgroundColor: AppColors.primary,
                onTap: () {
                  if (widget.id == null) {
                    ref
                        .read(addEventControllerProvider.notifier)
                        .updateEvent(EventModel());
                    context.pop();
                  } else {
                    ref.read(updateEventControllerProvider.notifier)
                      ..updateDataForEvent(EventModel(), widget.id!)
                      ..updateHandlers();
                  }
                },
                isFiled: false,
                height: 50.h,

                content: Text(
                  context.tr('confirm'),
                  style: AppTextStyle.rubikSemiBold16.copyWith(
                    color: AppColors.white,
                  ),
                ),
                width: double.infinity,
                radius: 10.r,
              ),
            ),
          24.verticalSpace,
        ],
      ),
    );
  }

  Column _buildHandlerSection(BuildContext context) {
    final isConfirmed = widget.id == null
        ? false
        : ref
                  .read(homeControllerProvider)
                  .value!
                  .occasionModel!
                  .value!
                  .status ==
              'Confirmed';
    final handlers = widget.id == null
        ? ref.watch(addEventControllerProvider).value!.handlers
        : ref.watch(updateEventControllerProvider).value!.handlers;
    return Column(
      children: [
        25.verticalSpace,
        if (handlers.isNotEmpty)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                context.tr('scan'),
                style: AppTextStyle.rubikRegular16.copyWith(
                  color: AppColors.black,
                ),
              ),
              17.horizontalSpace,
              Text(
                context.tr('edit'),
                style: AppTextStyle.rubikRegular16.copyWith(
                  color: AppColors.black,
                ),
              ),
              24.horizontalSpace,
            ],
          ),
        Expanded(
          child: handlers.isEmpty
              ? Assets.icons.emptyIc.svg()
              : ListView.separated(
                  itemBuilder: (context, index) {
                    if (index == handlers.length) {
                      return isConfirmed
                          ? SizedBox.shrink()
                          : Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 30.w,
                                vertical: 20.h,
                              ),
                              child: CustomButtonWidget(
                                text: '',
                                backgroundColor: AppColors.primary,
                                onTap: () {
                                  if (handlers.length >= 5) {
                                    AppToast.errorToast(
                                      'You can\'t add more than 5',
                                    );
                                  } else {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,

                                      builder: (context) =>
                                          AddOperatorHandlerBotomSheet(
                                            title: context.tr('addAuthorizeds'),
                                            onFinish: (number) {
                                              context.pop();
                                              if (widget.id == null) {
                                                ref
                                                    .read(
                                                      addEventControllerProvider
                                                          .notifier,
                                                    )
                                                    .addHandler(
                                                      HandlerModel(
                                                        whatsappNumber: number,
                                                        editEventAccess: 0,
                                                        guestListAccess: 1,
                                                        scanAccess: 0,
                                                      ),
                                                    );
                                              } else {
                                                ref
                                                    .read(
                                                      updateEventControllerProvider
                                                          .notifier,
                                                    )
                                                    .addHandler(
                                                      HandlerModel(
                                                        whatsappNumber: number,
                                                        editEventAccess: 0,
                                                        guestListAccess: 1,
                                                        scanAccess: 0,
                                                      ),
                                                    );
                                              }
                                            },
                                          ),
                                    );
                                  }
                                },
                                isFiled: false,
                                height: 50.h,
                                content: Text(
                                  context.tr('addAuthorizeds'),
                                  style: AppTextStyle.rubikSemiBold16.copyWith(
                                    color: AppColors.white,
                                  ),
                                ),
                                width: double.infinity,
                                radius: 10.r,
                              ),
                            );
                    }
                    return ListTile(
                      trailing: SizedBox(
                        width: 92.w,
                        child: Row(
                          children: [
                            Checkbox(
                              value: handlers[index].scanAccess == 1,
                              onChanged: (val) {
                                if (widget.id == null) {
                                  ref
                                      .read(addEventControllerProvider.notifier)
                                      .makeHandlerScanableOrNot(
                                        handlers[index],
                                      );
                                } else {
                                  ref
                                      .read(
                                        updateEventControllerProvider.notifier,
                                      )
                                      .makeHandlerScanableOrNot(
                                        handlers[index],
                                      );

                                  // ref
                                  //     .read(updateEventControllerProvider.notifier)
                                  //     .makeHandlerScanableOrNot(handlers[index]);
                                }
                              },
                              fillColor: WidgetStateProperty.resolveWith<Color>(
                                (states) {
                                  if (states.contains(WidgetState.selected)) {
                                    return AppColors.primary;
                                  }
                                  return AppColors.white;
                                },
                              ),
                            ),
                            Spacer(),
                            Checkbox(
                              value: handlers[index].editEventAccess == 1,
                              onChanged: (val) {
                                if (widget.id == null) {
                                  ref
                                      .read(addEventControllerProvider.notifier)
                                      .makeHandlerEditableOrNot(
                                        handlers[index],
                                      );
                                } else {
                                  ref
                                      .read(
                                        updateEventControllerProvider.notifier,
                                      )
                                      .makeHandlerEditableOrNot(
                                        handlers[index],
                                      );
                                }
                              },
                              fillColor: WidgetStateProperty.resolveWith<Color>(
                                (states) {
                                  if (states.contains(WidgetState.selected)) {
                                    return AppColors.primary;
                                  }
                                  return AppColors.white;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      title: Text(
                        handlers[index].whatsappNumber ?? '',
                        style: AppTextStyle.rubikRegular16.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      leading: GestureDetector(
                        onTap: () {
                          if (widget.id == null) {
                            ref
                                .read(addEventControllerProvider.notifier)
                                .removeHandler(handlers[index]);
                          } else {
                            ref
                                .read(updateEventControllerProvider.notifier)
                                .removeHandler(handlers[index]);
                          }
                        },
                        child: Assets.icons.deleteEventIc.svg(height: 25.h),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(height: 0),
                  itemCount: handlers.length + 1,
                ),
        ),
      ],
    );
  }

  Widget _buildOperatorSecton() {
    final isConfirmed = widget.id == null
        ? false
        : ref
                  .read(homeControllerProvider)
                  .value!
                  .occasionModel!
                  .value!
                  .status ==
              'Confirmed';
    final operator = widget.id == null
        ? ref.watch(
            addEventControllerProvider.select((val) => val.value!.operators),
          )
        : ref.watch(
            updateEventControllerProvider.select((val) => val.value!.operators),
          );
    return isConfirmed
        ? Assets.icons.emptyIc.svg()
        : ListView.separated(
            padding: EdgeInsets.only(top: 25.h),
            itemBuilder: (context, index) {
              if (index == operator.length) {
                return isConfirmed
                    ? SizedBox.shrink()
                    : Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.w,
                          vertical: 20.h,
                        ),
                        child: CustomButtonWidget(
                          text: '',
                          backgroundColor: AppColors.primary,
                          onTap: () {
                            if (operator.length >= 5) {
                              AppToast.errorToast('You can\'t add more than 5');
                            } else {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,

                                builder: (context) =>
                                    AddOperatorHandlerBotomSheet(
                                      title: context.tr('addOperators'),
                                      onFinish: (number) {
                                        context.pop();
                                        if (widget.id == null) {
                                          ref
                                              .read(
                                                addEventControllerProvider
                                                    .notifier,
                                              )
                                              .addOperator(
                                                HandlerModel(
                                                  whatsappNumber: number,
                                                  scanAccess: 1,
                                                  editEventAccess: 0,
                                                  guestListAccess: 0,
                                                ),
                                              );
                                        } else {
                                          ref
                                              .read(
                                                updateEventControllerProvider
                                                    .notifier,
                                              )
                                              .addOperator(
                                                HandlerModel(
                                                  whatsappNumber: number,
                                                  scanAccess: 1,
                                                  editEventAccess: 0,
                                                  guestListAccess: 0,
                                                ),
                                              );
                                        }
                                      },
                                    ),
                              );
                            }
                          },
                          isFiled: false,
                          height: 50.h,
                          content: Text(
                            context.tr('addOperators'),
                            style: AppTextStyle.rubikSemiBold16.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                          width: double.infinity,
                          radius: 10.r,
                        ),
                      );
              }
              return ListTile(
                title: Text(
                  operator[index].whatsappNumber!,
                  style: AppTextStyle.rubikRegular16.copyWith(
                    color: AppColors.black,
                  ),
                ),
                leading: GestureDetector(
                  onTap: () {
                    if (widget.id == null) {
                      ref
                          .read(addEventControllerProvider.notifier)
                          .removeOperator(operator[index]);
                    } else {
                      ref
                          .read(updateEventControllerProvider.notifier)
                          .removeOperator(operator[index]);
                    }
                  },
                  child: Assets.icons.deleteEventIc.svg(height: 25.h),
                ),
                // leading: Icon(Icons.delete, color: AppColors.red),
              );
            },

            separatorBuilder: (context, index) => Divider(height: 0),
            itemCount: operator.length + 1,
          );
  }
}
