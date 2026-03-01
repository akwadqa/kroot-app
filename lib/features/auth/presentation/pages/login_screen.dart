import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_app/features/auth/presentation/controller/auth_controller.dart';
import 'package:wedding_app/features/auth/presentation/controller/auth_ui_controller.dart';
import 'package:wedding_app/features/auth/presentation/controller/send_otp_controller.dart';
import 'package:wedding_app/features/auth/presentation/widgets/login_page/login_page_email_auth.dart';
import 'package:wedding_app/features/auth/presentation/widgets/login_page/login_page_google_auth.dart';
import 'package:wedding_app/features/auth/presentation/widgets/login_page/login_page_number_field.dart';
import 'package:wedding_app/features/auth/presentation/widgets/login_page/login_page_signin_button.dart';
import 'package:wedding_app/features/auth/presentation/widgets/login_page/login_page_terms_section.dart';
import 'package:wedding_app/src/extenssions/int_extenssion.dart';
import 'package:wedding_app/gen/assets.gen.dart';
import 'package:wedding_app/src/extenssions/widget_extensions.dart';
import 'package:wedding_app/src/routing/routes.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';
import 'package:wedding_app/src/utils/app_alert.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(sendOtpControllerProvider, (prev, next) {
      if (next is AsyncError) {
        context.pop();
        // if (!(next.value?.validation?.user_exist ?? true)) {
        // context.push(Routes.creataAccount , extra: _controller.text );
        // } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.error.toString())));
        // }
      }

      if (next is AsyncLoading) {
        AppAlert.showLoadingDialog(context);
      }

      if (next is AsyncData) {
        context.pop();
        print('*********************');
        print(next.value?.allow_login_after);
        print('*********************');

        if ((next.value?.allow_login_after != null)) {
          ref
              .read(authUiControllerProvider.notifier)
              .makeResendButtonVisibleOrNo(false);
          context.push(Routes.verification);
        } else {
          context.push(Routes.creataAccount, extra: _controller.text);
        }
        // ref.read(authUiControllerProvider.notifier).checkPhoneFilled(false);
      }
    });

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: Form(
          // key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              103.verticalSpace,
              //? Whatsapp icon :
              Center(child: Assets.icons.whatsappIc.svg()),
              20.verticalSpace,

              //? Title :
              Text(
                // "LogInUsingWhatsAppNumber".tr(),
                context.tr('LogInUsingWhatsAppNumber'),
                textAlign: TextAlign.center,
                style: AppTextStyle.rubikMedium20.copyWith(
                  color: AppColors.primary,
                ),
              ).symmetricPadding(horizontal: 10.w),
              20.verticalSpace,

              //? Send verification :
              Text(
                context.tr('sendVerificationCode'),
                textAlign: TextAlign.center,
                style: AppTextStyle.rubikRegular16.copyWith(
                  color: AppColors.primary,
                ),
              ).symmetricPadding(horizontal: 34.w),
              20.verticalSpace,

              //? Number field :
              LoginPageNumberField(_controller, _formKey),
              40.verticalSpace,

              //? Login button :
              LoginPageSigninButton(
                onTap: ref.watch(authUiControllerProvider).isPhoneFilled
                    ? () {
                        if (_formKey.currentState?.validate() ?? false) {
                          ref
                              .read(sendOtpControllerProvider.notifier)
                              .sendOtp(number: _controller.text);
                          // .sendOtp('999888777666');
                        }
                      }
                    : null,
              ),

              15.verticalSpace,

              //? Signup section :
              Text.rich(
                TextSpan(
                  text: context.tr('don’tHaveAnAccountYet'),
                  style: AppTextStyle.rubikRegular14.copyWith(
                    color: AppColors.primary,
                  ),
                  children: [
                    TextSpan(
                      text: context.tr('signUp'),
                      style: AppTextStyle.rubikMedium15.copyWith(
                        color: AppColors.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              20.verticalSpace,

              //? Or section :
              Row(
                children: [
                  Expanded(
                    child: Container(height: 1.h, color: AppColors.grayBorder),
                  ),
                  16.horizontalSpace,
                  Text(
                    context.tr('or'),
                    style: AppTextStyle.bodyXsmallRegular.copyWith(
                      color: AppColors.gray,
                    ),
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: Container(height: 1.h, color: AppColors.grayBorder),
                  ),
                ],
              ),

              20.verticalSpace,

              //? Email auth
              LoginPageEmailAuth(),
              20.verticalSpace,

              //? Google auth
              LoginPageGoogleAuth(),
              20.verticalSpace,

              //? Privacy :
              LoginPageTermsSection(),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
