import 'dart:async';
import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/auth/presentation/controller/auth_controller.dart';
import 'package:kroot_app/features/auth/presentation/controller/auth_ui_controller.dart';
import 'package:kroot_app/features/auth/presentation/controller/send_otp_controller.dart';
import 'package:kroot_app/features/auth/presentation/widgets/verification_page/verification_page_confirm_button.dart';
import 'package:kroot_app/features/auth/presentation/widgets/verification_page/verification_page_expired_timer.dart';
import 'package:kroot_app/features/auth/presentation/widgets/verification_page/verification_page_input_button.dart';
import 'package:kroot_app/features/auth/presentation/widgets/verification_page/verification_page_pin.dart';
import 'package:kroot_app/features/cards/presentation/controller/cards_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/app_toast.dart';

class VerificationScreen extends ConsumerStatefulWidget {
  const VerificationScreen(this.number, {super.key});
  final String? number;

  @override
  ConsumerState<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends ConsumerState<VerificationScreen> {
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ref.listen(
        authControllerProvider.select((val) => val.value!.verifyOtpResponse),
        (prev, next) {
      if (next is AsyncLoading) {
        AppAlert.showLoadingDialog(context);
      }

      if (next is AsyncError) {
        if (prev is AsyncLoading) context.pop();
        Future.delayed(const Duration(milliseconds: 100), () {
          AppToast.errorToast(next?.error.toString() ?? 'error'.tr());
        });
      }
      if (next is AsyncData) {
        context.pop();
        context.go(Routes.main);
        ref.read(homeControllerProvider.notifier)
          ..getUserEvents(page: 1)
          ..getUtils();
        ref.read(cardsControllerProvider.notifier).getTemplateCategories();
      }
    });

    ref.listen(
        authControllerProvider.select((val) => val.value!.resendOtpResponse),
        (prev, next) {
      if (next is AsyncLoading) {
        AppAlert.showLoadingDialog(context);
      }

      if (next is AsyncError) {
        if (prev is AsyncLoading) context.pop();
        Future.delayed(const Duration(milliseconds: 100), () {
          AppToast.errorToast(next?.error.toString() ?? 'error'.tr());
        });
      }
      if (next is AsyncData) {
        context.pop();
        ref
            .read(authUiControllerProvider.notifier)
            .makeResendButtonVisibleOrNo(false);
        AppToast.doneToast('successfullyCompleted'.tr());
      }
    });

    return Scaffold(
      body: Form(
        key: _key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            28.verticalSpace,

            Directionality(
              textDirection: ui.TextDirection.ltr,
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Assets.icons.verificationArrowBackIc.svg().onlyPadding(
                        start: 22.w,
                      ),
                ),
              ),
            ),
            79.verticalSpace,

            Text(
              context.tr('VerificationCodeValidatorMessage'),
              style: AppTextStyle.rubikMedium20.copyWith(
                color: AppColors.primary,
              ),
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.tr('sentACode'),
                  style: AppTextStyle.rubikRegular16.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                Directionality(
                  textDirection: ui.TextDirection.ltr,
                  child: Consumer(
                    builder: (context, ref, _) {
                      final number = ref.read(
                        sendOtpControllerProvider.select((val) {
                          return val.value?.mobile_number;
                        }),
                      );
                      return Text(
                        widget.number ?? number ?? '',
                        style: AppTextStyle.rubikRegular16.copyWith(
                          color: AppColors.primary,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            20.verticalSpace,

            VerificationPagePin(controller: controller),
            20.verticalSpace,

            VerificationPageConfirmButton(
              onTap: !ref.read(authUiControllerProvider).isResendVisible
                  ? () {
                      if (_key.currentState!.validate()) {
                        ref
                            .read(authControllerProvider.notifier)
                            .verifyOtp(controller.text, widget.number);
                      }
                    }
                  : null,
            ),
            15.verticalSpace,

            VerificationPageExpiredTimer(),
            15.verticalSpace,

            Visibility(
              visible: ref.watch(authUiControllerProvider).isResendVisible,
              child: TextButton(
                onPressed: () {
                  final number =
                      ref.read(sendOtpControllerProvider).value?.mobile_number;

                  ref
                      .read(authControllerProvider.notifier)
                      .resendOtp(widget.number ?? number ?? '');
                },
                child: Text(
                  'Resend code',
                  style: AppTextStyle.rubikRegular14.copyWith(
                    color: AppColors.nevy,
                  ),
                ),
              ),
            ),
            Spacer(),

            // Directionality(
            //   textDirection: ui.TextDirection.ltr,
            //   child: SizedBox(
            //     width: double.infinity,
            //     height: 216.h,
            //     child: GridView.builder(
            //       padding: EdgeInsets.symmetric(horizontal: 6.w),
            //       itemCount: keys.length,
            //       physics: NeverScrollableScrollPhysics(),
            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         childAspectRatio: 117 / 46,
            //         crossAxisCount: 3,
            //         crossAxisSpacing: 6.w,
            //         mainAxisSpacing: 7.h,
            //       ),
            //       itemBuilder: (context, index) {
            //         if (index == 9) {
            //           return VerificationPageInputButton.delet(() {
            //             if (controller.text.isNotEmpty) {
            //               controller.text = controller.text.substring(
            //                 0,
            //                 controller.text.length - 1,
            //               );
            //             }
            //           });
            //         }

            //         if (index == 11) {
            //           return VerificationPageInputButton.done(
            //             !ref.read(authUiControllerProvider).isResendVisible
            //                 ? () {
            //                     if (_key.currentState!.validate()) {
            //                       ref
            //                           .read(authControllerProvider.notifier)
            //                           .verifyOtp(
            //                             controller.text,
            //                             widget.number,
            //                           );
            //                     }
            //                   }
            //                 : null,
            //           );
            //         }
            //         return VerificationPageInputButton.label(keys[index], () {
            //           if (controller.text.length < 4) {
            //             controller.text += keys[index];
            //           }
            //         });
            //       },
            //     ),
            //   ),
            // ),
            8.verticalSpace,
          ],
        ),
      ),
    );
  }
}
