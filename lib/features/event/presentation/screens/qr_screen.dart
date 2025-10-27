import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_app/features/event/presentation/controller/home_controller.dart';
import 'package:wedding_app/gen/assets.gen.dart';
import 'package:wedding_app/src/bottm_navigation_bar_provider.dart';
import 'package:wedding_app/src/extenssions/int_extenssion.dart';
import 'package:wedding_app/src/extenssions/widget_extensions.dart';
import 'package:wedding_app/src/shared_widgets/custom_appbar.dart';
import 'package:wedding_app/src/shared_widgets/custom_button_widget.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';
import 'package:wedding_app/src/utils/app_alert.dart';

import '../../../../src/routing/routes.dart';

class QrScreen extends ConsumerWidget {
  const QrScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late BuildContext ctx;
    ref.listen(homeControllerProvider, (prev, next) {
      //? This listener for create event from this screen :
      if (next.value?.isCreatingEvent != null) {
        //? Loading :
        if (next is AsyncLoading) {
          AppAlert.showLoadingDialog(ctx);
        }

        //? Loaded and the last will be loading - not error :
        if (next is AsyncData && prev is AsyncLoading) {
          //? Close the loading
          ctx.pop();

          //? Go to home
          // context.pushReplacement(Routes.main);
          context.pushReplacement(
            Routes.eventDetails,
            extra: next.value!.createEventResponse!.eventId,
          );

          //? Change the tab
          ref.read(bottomNavIndexProvider.notifier).setIndex(0);

          //? Cleare event details in create event screen
          ref.read(homeControllerProvider.notifier).clearEventScreen();

          //? Show message :
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('content added')));
        }

        //? Error :
        if (next is AsyncError) {
          ctx.pop();
          // ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(next.error.toString())));
        }
      }
    });
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
                          context.tr('personalAccessCard'),
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
                      20.verticalSpace,
                      Assets.images.krootInviteImage.image(),
                      10.verticalSpace,
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 44.h,
                        color: AppColors.primary,
                        child: Row(
                          children: [
                            14.horizontalSpace,
                            Text(
                              context.tr('guests'),
                              style: AppTextStyle.rubikSemiBold18.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                            Text(
                              ': 1 ',
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
                    ],
                  ),
                ),
              ),

              Spacer(),
              CustomButtonWidget(
                text: '',
                onTap: () {
                  context.push(Routes.sendInvite);
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
