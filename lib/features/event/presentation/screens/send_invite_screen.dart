import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/src/extenssions/int_extenssion.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/app_toast.dart';

class SendInviteScreen extends ConsumerWidget {
  const SendInviteScreen({super.key, required this.eventModel});
  final EventModel eventModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late BuildContext ctx;

    ref.listen(
      homeControllerProvider.select((val) => val.value!.confirmEventResponse),
      (prev, next) {
        if (next is AsyncLoading) {
          AppAlert.showLoadingDialog(ctx);
        }

        if (next is AsyncData) {
          ctx.pop();
          AppToast.doneToast('successfullyCompleted'.tr());
          context.pop();
          ref
              .read(homeControllerProvider.notifier)
              .getEventDetails(next!.value!.occasionId!);

          ref.read(homeControllerProvider.notifier)
            ..getUserEvents(page: 1)
            ..getUtils();

          context.go(
            Routes.eventDetails,
            extra: {'id': next.value!.occasionId},
          );
        }
        if (next is AsyncError) {
          ctx.pop();
          AppToast.errorToast(next!.error.toString());
        }
      },
    );

    return Scaffold(
      appBar: CustomAppbar(title: context.tr('send'), withBackButton: true),
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

                  return Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          Divider(color: AppColors.grayBorder),
                      padding: EdgeInsets.zero,
                      itemCount: eventModel.guests?.length ?? 0,

                      itemBuilder: (context, index) => ListTile(
                        title: Text(
                          eventModel.guests![index].fullName!,
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
                              eventModel
                                          .guests![index]
                                          .whatsappNumber
                                          ?.isNotEmpty ??
                                      false
                                  ? eventModel.guests![index].whatsappNumber!
                                  : context.tr('no_phone'),

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

              CustomButtonWidget(
                text: '',
                onTap: () {
                  ref
                      .read(homeControllerProvider.notifier)
                      .confirmEvent(eventModel.occasionId!);
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
