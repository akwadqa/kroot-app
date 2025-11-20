import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_app/features/event/presentation/controller/add_event/add_event_controller.dart';
import 'package:wedding_app/features/event/presentation/controller/home_controller.dart';
import 'package:wedding_app/features/event/presentation/controller/update_event/update_event_controller.dart';
import 'package:wedding_app/src/bottm_navigation_bar_provider.dart';
import 'package:wedding_app/src/extenssions/int_extenssion.dart';
import 'package:wedding_app/src/extenssions/widget_extensions.dart';
import 'package:wedding_app/src/routing/routes.dart';
import 'package:wedding_app/src/shared_widgets/custom_appbar.dart';
import 'package:wedding_app/src/shared_widgets/custom_button_widget.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';
import 'package:wedding_app/src/utils/app_alert.dart';
import 'package:wedding_app/src/utils/app_toast.dart';

class SendInviteScreen extends ConsumerWidget {
  const SendInviteScreen({super.key, required this.id});
  final String? id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late BuildContext ctx;
    if (id == null) {
      //? Listener for add :
      ref.listen(addEventControllerProvider, (prev, next) {
        //? This listener for create event in this screen :
        if (next.value!.isAddEvent != null) {
          //? For loading :
          if (next is AsyncLoading) {
            AppAlert.showLoadingDialog(ctx);
          }

          if (next is AsyncData && prev is AsyncLoading) {
            // if (context.canPop()) {
            ctx.pop();
            AppToast.doneToast('Done');

            // context.pushReplacement(Routes.main);
            // ref.read(bottomNavIndexProvider.notifier).setIndex(0);

            context.go(
              Routes.eventDetails,
              // extra: widget.id != null
              //? next.value!.updatedEvent!.occasionId
              extra: next.value!.createEventResponse?.eventId,
            );
            ref.read(addEventControllerProvider.notifier).clearEventScreen();
          }
          // }

          if (next is AsyncError && prev is AsyncLoading) {
            ctx.pop();
            AppToast.errorToast(next.error.toString());
          }
        }

        //? This listener for add new contact :
        if (next.value?.isAddContact ?? false) {
          if (next is AsyncData) {
            context.pop();
            AppToast.doneToast('Contact added!');
          }

          if (next is AsyncError) {
            context.pop();
            AppToast.errorToast(next.error.toString());
          }
        }
      });
    } else {
      ref.listen(updateEventControllerProvider, (prev, next) {
        //? This listener for create event in this screen :
        if (next.value!.isUpdateEvent != null) {
          //? For loading :
          if (next is AsyncLoading) {
            AppAlert.showLoadingDialog(ctx);
          }

          if (next is AsyncData && prev is AsyncLoading) {
            // if (context.canPop()) {
            ctx.pop();
            AppToast.doneToast('Done');

            // context.pushReplacement(Routes.main);
            // ref.read(bottomNavIndexProvider.notifier).setIndex(0);

            context.go(
              Routes.eventDetails,
              // extra: widget.id != null
              //? next.value!.updatedEvent!.occasionId
              extra: next.value!.updatedEvent?.occasionId,
            );
            ref.read(addEventControllerProvider.notifier).clearEventScreen();
          }
          // }

          if (next is AsyncError && prev is AsyncLoading) {
            ctx.pop();
            AppToast.errorToast(next.error.toString());
          }
        }
      });
    }

    return Scaffold(
      appBar: CustomAppbar(title: context.tr('send')),
      body: Builder(
        builder: (context) {
          ctx = context;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.verticalSpace,

              Text(
                context.tr('sendInvite'),
                style: AppTextStyle.rubikSemiBold18.copyWith(
                  color: AppColors.primary,
                ),
              ),
              12.verticalSpace,

              Text(
                context.tr('sendEventInvite'),
                style: AppTextStyle.rubikRegular14.copyWith(
                  color: AppColors.primary,
                ),
              ),

              Consumer(
                builder: (context, ref, child) {
                  final contact = id != null
                      ? ref
                            .read(updateEventControllerProvider)
                            .value!
                            .selectedContacts
                      : ref
                            .read(addEventControllerProvider)
                            .value!
                            .selectedContacts;
                  return Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          Divider(color: AppColors.grayBorder),
                      padding: EdgeInsets.zero,
                      itemCount: contact!.length,

                      itemBuilder: (context, index) => ListTile(
                        title: Text(
                          '${contact[index].contact.name.first} ${contact[index].contact.name.last}',
                          // 'Hadeel',
                          style: AppTextStyle.rubikRegular16.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                        subtitle: Directionality(
                          textDirection: ui.TextDirection.ltr,
                          child: Align(
                            alignment: context.locale.languageCode == 'ar'
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Text(
                              // contact[index].contact.phones.first.number,
                              contact[index].contact.phones.isNotEmpty
                                  ? contact[index].contact.phones.first.number
                                  : context.tr('no_phone'),
                              // '+974999999999',
                              style: AppTextStyle.rubikRegular16.copyWith(
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              // Spacer(),
              CustomButtonWidget(
                text: '',
                onTap: () {
                  // context.pushReplacement(Routes.eventDetails, extra: id);

                  id != null
                      ? ref
                            .read(updateEventControllerProvider.notifier)
                            .updateEventToServer(id!)
                      : ref
                            .read(addEventControllerProvider.notifier)
                            .createEvent();
                },
                backgroundColor: AppColors.primary,
                isFiled: true,
                height: 44.h,
                content: Text(
                  context.tr('send'),
                  style: AppTextStyle.rubikSemiBold18.copyWith(
                    color: AppColors.white,
                  ),
                ),
                width: double.infinity,
              ),
              18.verticalSpace,
            ],
          ).symmetricPadding(horizontal: 22.w);
        },
      ),
    );
  }
}
