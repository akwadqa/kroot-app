import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/event/presentation/controller/add_event/add_event_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/update_event/update_event_controller.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/extenssions/int_extenssion.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/app_toast.dart';

import '../../../../src/routing/routes.dart';

class QrScreen extends ConsumerWidget {
  const QrScreen({super.key, required this.id});
  final String? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late BuildContext ctx;
    if (id == null) {
      ref.listen(addEventControllerProvider, (prev, next) {
        if (next.value!.isAddEvent != null) {
          if (next is AsyncLoading) {
            AppAlert.showLoadingDialog(ctx);
          }

          if (next is AsyncData && prev is AsyncLoading) {
            ctx.pop();
            AppToast.doneToast("successfullyCompleted".tr());

            ref.read(homeControllerProvider.notifier)
              ..getUserEvents(page: 1)
              ..getUtils();

            context.go(
              Routes.eventDetails,

              extra: {'id': next.value!.createEventResponse?.eventId},
            );
            ref.read(addEventControllerProvider.notifier).clearEventScreen();
          }

          if (next is AsyncError && prev is AsyncLoading) {
            ctx.pop();
            AppToast.errorToast(next.error.toString());
          }
        }

        if (next.value?.isAddContact ?? false) {
          if (next is AsyncData) {
            context.pop();
            AppToast.doneToast('successfullyCompleted'.tr());
          }

          if (next is AsyncError) {
            context.pop();
            AppToast.errorToast(next.error.toString());
          }
        }
      });
    } else {
      ref.listen(updateEventControllerProvider, (prev, next) {
        if (next.value!.isUpdateEvent != null) {
          if (next is AsyncLoading) {
            AppAlert.showLoadingDialog(ctx);
          }

          if (next is AsyncData && prev is AsyncLoading) {
            ctx.pop();
            AppToast.doneToast("successfullyCompleted".tr());

            ref.read(homeControllerProvider.notifier)
              ..getUserEvents(page: 1)
              ..getUtils();

            context.go(
              Routes.eventDetails,

              extra: {'id': next.value!.updatedEvent?.occasionId},
            );
            ref.read(addEventControllerProvider.notifier).clearEventScreen();
          }

          if (next is AsyncError && prev is AsyncLoading) {
            ctx.pop();
            AppToast.errorToast(next.error.toString());
          }
        }
      });
    }

    final guests = ref
        .read(addEventControllerProvider)
        .value!
        .selectedContacts!
        .length
        .toString();

    return Scaffold(
      appBar: CustomAppbar(title: context.tr('qrPreview')),

      body: Builder(
        builder: (context) {
          ctx = context;
          return Column(
            children: [
              40.verticalSpace,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 39.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 4,
                      color: AppColors.black.withValues(alpha: .25),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 44.h,
                        color: AppColors.primary,
                        child: Text(
                          context.tr('appTitle'),
                          style: AppTextStyle.rubikSemiBold18.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      30.verticalSpace,
                      Text(
                        context.tr('pleaseShowCode'),
                        style: AppTextStyle.rubikMedium16.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      20.verticalSpace,
                      Assets.images.qrCodeImage.image(),
                      30.verticalSpace,
                      // Assets.images.krootInviteImage.image(),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 44.h,
                        color: AppColors.primary,
                        child: Directionality(
                          textDirection: ui.TextDirection.ltr,
                          child: Row(
                            children: [
                              14.horizontalSpace,
                              Text(
                                // '${context.tr('guests')} : $guests',
                                'Guests : $guests',
                                style: AppTextStyle.rubikSemiBold18.copyWith(
                                  color: AppColors.white,
                                ),
                              ),

                              Spacer(),
                              Text(
                                'www.kroot.com',
                                style: AppTextStyle.rubikRegular14.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                              14.horizontalSpace,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Spacer(),
              CustomButtonWidget(
                text: '',
                onTap: () {
                  ref.read(addEventControllerProvider.notifier).createEvent();
                },
                backgroundColor: AppColors.primary,
                isFiled: true,
                height: 44.h,
                content: Text(
                  context.tr('continue'),
                  style: AppTextStyle.rubikSemiBold18.copyWith(
                    color: AppColors.white,
                  ),
                ),
                width: double.infinity,
              ).symmetricPadding(horizontal: 22.w, vertical: 18.h),
            ],
          );
        },
      ),
    );
  }
}
