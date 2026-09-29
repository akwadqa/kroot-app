import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/presentation/controller/add_event/add_event_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/update_event/update_event_controller.dart';
import 'package:kroot_app/features/event/presentation/screens/invite_template_screen.dart';
import 'package:kroot_app/features/event/presentation/widgets/create_event_page/add_event_page_botton.dart';
import 'package:kroot_app/features/event/presentation/widgets/template_options_page/custom_invitation_tile.dart';
import 'package:kroot_app/features/event/presentation/widgets/template_options_page/template_option_bottom_sheet.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';

class TemplatesOptionsScreen extends ConsumerWidget {
  const TemplatesOptionsScreen({super.key, this.id});
  final String? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isQr = id != null
        ? ref.watch(
            updateEventControllerProvider.select((val) {
              return val.value!.isQr ?? false;
            }),
          )
        : ref.watch(
            addEventControllerProvider.select((val) {
              return val.value!.isQr ?? false;
            }),
          );

    final isLocation = id != null
        ? ref.watch(
            updateEventControllerProvider.select((val) {
              return val.value!.isLocation ?? false;
            }),
          )
        : ref.watch(
            addEventControllerProvider.select((val) {
              return val.value!.isLocation ?? false;
            }),
          );

    final isConfirmation = id != null
        ? ref.watch(
            updateEventControllerProvider.select((val) {
              return val.value!.isConfirmation ?? false;
            }),
          )
        : ref.watch(
            addEventControllerProvider.select((val) {
              return val.value!.isConfirmation ?? false;
            }),
          );

    final templateMessage = id != null
        ? ref.watch(
            updateEventControllerProvider.select((val) {
              return val.value!.templateMessage;
            }),
          )
        : ref.watch(
            addEventControllerProvider.select((val) {
              return val.value!.templateMessage;
            }),
          );

    return Scaffold(
      appBar: CustomAppbar(title: context.tr('customize_invitation')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          14.verticalSpace,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.tr('chose_template_optiosn'),
                style: AppTextStyle.rubikMedium16.copyWith(
                  color: AppColors.blackText,
                ),
              ),
              20.verticalSpace,
              CustomizeInvitationTile(
                isSelected: isQr,
                svg: Assets.icons.customizeInvitationQrIc,
                title: context.tr('qr_code'),
                onChanged: (val) => id == null
                    ? ref
                        .read(addEventControllerProvider.notifier)
                        .changeQrState(val!)
                    : ref
                        .read(updateEventControllerProvider.notifier)
                        .changeQrState(val!),
              ),
              16.verticalSpace,
              CustomizeInvitationTile(
                isSelected: isLocation,
                svg: Assets.icons.customizeInvitationLocationIc,
                title: context.tr('eventLocation'),
                onChanged: (val) => id == null
                    ? ref
                        .read(addEventControllerProvider.notifier)
                        .changeLocationState(val!)
                    : ref
                        .read(updateEventControllerProvider.notifier)
                        .changeLocationState(val!),
              ),
              16.verticalSpace,
              CustomizeInvitationTile(
                isSelected: isConfirmation,
                svg: Assets.icons.customizeInvitationConfirmIc,
                title: context.tr('confirmation'),
                onChanged: (val) => id == null
                    ? ref
                        .read(addEventControllerProvider.notifier)
                        .changeConfirmationState(val!)
                    : ref
                        .read(updateEventControllerProvider.notifier)
                        .changeConfirmationState(val!),
              ),
              26.verticalSpace,
              Text(
                context.tr('choose_invitation_message'),
                style: AppTextStyle.rubikMedium16.copyWith(
                  color: AppColors.blackText,
                ),
              ),
              12.verticalSpace,
              Container(
                decoration: BoxDecoration(
                  color: AppColors.grayField,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 2,
                      spreadRadius: 3,
                      color: AppColors.grayShadow.withValues(alpha: .24),
                    ),
                  ],
                ),
                child: TextField(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => TemplateOptionsBottomSheet(),
                  ),
                  readOnly: true,
                  decoration: InputDecoration(
                    hint: Text(
                      templateMessage.isEmpty
                          ? context.tr('select_message')
                          : getTemplateMessage(
                              templateMessage,
                              ref,
                              id,
                            ),
                      style: AppTextStyle.rubikRegular16.copyWith(
                          color: templateMessage.isEmpty
                              ? AppColors.grayHint
                              : AppColors.blackText),
                    ).onlyPadding(start: 12.w, top: 10.h, bottom: 10.h),
                    contentPadding: EdgeInsets.zero,
                    suffixIcon: Icon(
                      Icons.arrow_drop_down_rounded,
                      color: AppColors.primary,
                    ),
                    fillColor: AppColors.white,
                    filled: true,
                    // iconSize: 28,,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: AppColors.grayBorder),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: AppColors.grayBorder),
                    ),
                  ),
                ),
              )
            ],
          )),
          if (true) _buildFooter(ref, context),
          20.verticalSpace,
        ],
      ).symmetricPadding(horizontal: 22.w),
    );
  }

  Widget _buildFooter(WidgetRef ref, BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: id != null
          ? CustomButtonWidget(
              text: '',
              onTap: () {
                _onContinue(ref, context);
              },
              isFiled: true,
              content: Text(
                context.tr("continue".tr()),
                style: AppTextStyle.nunitoBold16.copyWith(
                  color: AppColors.white,
                ),
              ),
              height: 60.h,
              width: 330.w,
              backgroundColor: AppColors.primary,
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AddEventPageBotton(
                  onTap: () {
                    id == null
                        ? ref
                            .read(addEventControllerProvider.notifier)
                            .createEvent()
                        : ref
                            .read(
                              updateEventControllerProvider.notifier,
                            )
                            .updateEventToServer(id!);
                  },
                  isSubmit: false,
                  child: Text(
                    context.tr('saveDraft'),
                    style: AppTextStyle.rubikSemiBold18.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
                AddEventPageBotton(
                  onTap: () => _onContinue(ref, context),
                  // onTap: id != null
                  //     ? ref
                  //             .watch(updateEventControllerProvider)
                  //             .value!
                  //             .selectedContacts!
                  //             .isEmpty
                  //         ? null
                  //         : () {
                  //             context.push(
                  //               Routes.inviteTemplate,
                  //               extra: id,
                  //             );
                  //           }
                  //     : ref
                  //             .watch(addEventControllerProvider)
                  //             .value!
                  //             .selectedContacts!
                  //             .isEmpty
                  //         ? null
                  //         : () {
                  //             context.push(Routes.inviteTemplate);
                  //           },
                  isSubmit: id != null
                      ? true
                      : ref
                          .read(addEventControllerProvider)
                          .value!
                          .selectedContacts!
                          .isNotEmpty,
                  child: Text(
                    context.tr('continue'),
                    style: AppTextStyle.rubikSemiBold18.copyWith(
                      color: AppColors.white,
                      // ? ref
                      //         .watch(updateEventControllerProvider)
                      //         .value!
                      //         .selectedContacts!
                      //         .isEmpty
                      //     ? AppColors.primary
                      //     : AppColors.white
                      // : ref
                      //         .watch(addEventControllerProvider)
                      //         .value!
                      //         .selectedContacts!
                      //         .isEmpty
                      //     ? AppColors.primary
                      //     : AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  void _onContinue(WidgetRef ref, BuildContext context) {
    id == null
        ? _chechCreateEvent(ref, context)
        : _chechUpdateEvent(ref, context);
  }

  void _chechCreateEvent(WidgetRef ref, BuildContext context) {
    final selectedTemplate = ref.watch(
      addEventControllerProvider.select((val) {
        return val.value!.templateMessage;
      }),
    );

    if (selectedTemplate.isEmpty) {
      return;
    }

    final isQr = ref.watch(
      addEventControllerProvider.select((val) {
        return val.value!.isQr ?? false;
      }),
    );
    final isConfirm = ref.watch(
      addEventControllerProvider.select((val) {
        return val.value!.isConfirmation ?? false;
      }),
    );
    String qrDelivery;
    if (isQr && isConfirm) {
      qrDelivery = 'On Confirmation';
    } else if (isQr && !isConfirm) {
      qrDelivery = 'Immediate';
    } else {
      qrDelivery = 'Disabled';
    }

    ref
        .read(addEventControllerProvider.notifier)
        .updateEvent(EventModel(qrDelivery: qrDelivery));

    context.push(Routes.inviteTemplate, extra: id);
  }

  void _chechUpdateEvent(WidgetRef ref, BuildContext context) {
    final selectedTemplate = ref.watch(
      updateEventControllerProvider.select((val) {
        return val.value!.templateMessage;
      }),
    );

    if (selectedTemplate.isEmpty) {
      return;
    }

    final isQr = ref.watch(
      updateEventControllerProvider.select((val) {
        return val.value!.isQr ?? false;
      }),
    );
    final isConfirm = ref.watch(
      updateEventControllerProvider.select((val) {
        return val.value!.isConfirmation ?? false;
      }),
    );
    String qrDelivery;
    if (isQr && isConfirm) {
      qrDelivery = 'On Confirmation';
    } else if (isQr && !isConfirm) {
      qrDelivery = 'Immediate';
    } else {
      qrDelivery = 'Disabled';
    }

    ref
        .read(updateEventControllerProvider.notifier)
        .updateDataForEvent(EventModel(qrDelivery: qrDelivery), id!);

    context.push(Routes.inviteTemplate, extra: id);
  }
}
