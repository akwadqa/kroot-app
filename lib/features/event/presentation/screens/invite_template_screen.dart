import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_app/features/event/presentation/controller/home_controller.dart';
import 'package:wedding_app/features/event/presentation/widgets/create_event_page/add_event_page_botton.dart';
import 'package:wedding_app/gen/assets.gen.dart';
import 'package:wedding_app/src/bottm_navigation_bar_provider.dart';
import 'package:wedding_app/src/extenssions/int_extenssion.dart';
import 'package:wedding_app/src/extenssions/widget_extensions.dart';
import 'package:wedding_app/src/routing/routes.dart';
import 'package:wedding_app/src/shared_widgets/custom_appbar.dart';
import 'package:wedding_app/src/shared_widgets/custom_button_widget.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';
import 'package:wedding_app/src/utils/app_alert.dart';

class InviteTemplateScreen extends ConsumerWidget {
  const InviteTemplateScreen({super.key});

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
      appBar: CustomAppbar(title: context.tr('createEvent')),
      body: Builder(
        builder: (context) {
          ctx = context;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              30.verticalSpace,
              Text(
                context.tr('preview'),
                style: AppTextStyle.rubikSemiBold18.copyWith(
                  color: AppColors.primary,
                ),
              ),
              12.verticalSpace,
              Text(
                context.tr('inviteLooks'),
                style: AppTextStyle.rubikRegular14.copyWith(
                  color: AppColors.primary,
                ),
              ),
              20.verticalSpace,

              //? invite item :
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 4,
                        color: AppColors.primary.withValues(alpha: .25),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Assets.images.weddingImage.image(),

                      18.verticalSpace,
                      Text(
                        'Hadeel',
                        style: AppTextStyle.rubikMedium16.copyWith(
                          color: AppColors.black,
                        ),
                      ).onlyPadding(start: 18.w),

                      10.verticalSpace,
                      Text(
                        context.tr('weddingInvite'),
                        style: AppTextStyle.rubikRegular14.copyWith(
                          color: AppColors.black,
                        ),
                      ).onlyPadding(start: 18.w),

                      18.verticalSpace,

                      //? Buttons :
                      Row(
                        children: [
                          Spacer(),
                          CustomButtonWidget(
                            text: '',
                            backgroundColor: AppColors.white,
                            content: Text(
                              context.tr('confirm'),
                              style: AppTextStyle.rubikRegular18.copyWith(
                                color: AppColors.black,
                              ),
                            ),
                            boxDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 2),
                                  blurRadius: 4,
                                  color: AppColors.primary.withValues(
                                    alpha: .25,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {},
                            isFiled: true,
                            height: 44.h,
                            width: 138.w,
                          ),
                          Spacer(),
                          CustomButtonWidget(
                            text: '',
                            backgroundColor: AppColors.white,
                            content: Text(
                              context.tr('declined'),
                              style: AppTextStyle.rubikRegular18.copyWith(
                                color: AppColors.black,
                              ),
                            ),
                            boxDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 2),
                                  blurRadius: 4,
                                  color: AppColors.primary.withValues(
                                    alpha: .25,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {},
                            isFiled: true,
                            height: 44.h,
                            width: 125.w,
                          ),

                          Spacer(),
                        ],
                      ),
                      18.verticalSpace,
                      CustomButtonWidget(
                        text: '',
                        backgroundColor: AppColors.white,
                        content: Text(
                          context.tr('eventLocation'),
                          style: AppTextStyle.rubikRegular18.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                        boxDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 4,
                              color: AppColors.primary.withValues(alpha: .25),
                            ),
                          ],
                        ),
                        onTap: () {},
                        isFiled: true,
                        height: 44.h,
                        width: double.infinity,
                      ).symmetricPadding(horizontal: 22.w),
                      18.verticalSpace,
                    ],
                  ),
                ),
              ),

              Spacer(),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AddEventPageBotton(
                      onTap: () {
                        ref.read(homeControllerProvider.notifier).createEvent();
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
                      onTap: () {
                        context.push(Routes.qrScreen);
                      },
                      isSubmit: true,
                      child: Text(
                        context.tr('continue'),
                        style: AppTextStyle.rubikSemiBold18.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              18.verticalSpace,
            ],
          ).symmetricPadding(horizontal: 18.w);
        },
      ),
    );
  }
}
