import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/auth/application/auth_service.dart';
import 'package:kroot_app/features/auth/presentation/controller/auth_controller.dart';
import 'package:kroot_app/features/auth/presentation/controller/auth_ui_controller.dart';
import 'package:kroot_app/features/auth/presentation/controller/send_otp_controller.dart';
import 'package:kroot_app/features/auth/presentation/widgets/login_page/login_page_number_field.dart';
import 'package:kroot_app/features/auth/presentation/widgets/login_page/login_page_signin_button.dart';
import 'package:kroot_app/features/auth/presentation/widgets/login_page/login_page_terms_section.dart';
import 'package:kroot_app/src/extenssions/int_extenssion.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/app_toast.dart';

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
    super.initState();
    Future(() {
      final token = ref.read(userDataProvider);
      if (token == null) {
        context.pushReplacement(Routes.start);
      }
    });

    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(sendOtpControllerProvider, (prev, next) {
      if (next is AsyncError) {
        context.pop();
        AppToast.errorToast(next.error.toString());
      }

      if (next is AsyncLoading) {
        AppAlert.showLoadingDialog(context);
      }

      if (next is AsyncData) {
        context.pop();
        ref
            .read(authUiControllerProvider.notifier)
            .makeResendButtonVisibleOrNo(false);

        if ((next.value?.validation?.user_exist == true)) {
          if (prev?.value?.validation?.user_exist == true) {
          } else {
            context.push(Routes.verification);
          }
        } else {
          context.go(Routes.creataAccount, extra: _controller.text);
        }
      }
    });

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              103.verticalSpace,
              Center(child: Assets.icons.whatsappIc.svg()),
              20.verticalSpace,
              Text(
                context.tr('LogInUsingWhatsAppNumber'),
                textAlign: TextAlign.center,
                style: AppTextStyle.rubikMedium20.copyWith(
                  color: AppColors.primary,
                ),
              ).symmetricPadding(horizontal: 10.w),
              20.verticalSpace,
              Text(
                context.tr('sendVerificationCode'),
                textAlign: TextAlign.center,
                style: AppTextStyle.rubikRegular16.copyWith(
                  color: AppColors.primary,
                ),
              ).symmetricPadding(horizontal: 34.w),
              20.verticalSpace,
              LoginPageNumberField(_controller, _formKey),
              40.verticalSpace,
              LoginPageSigninButton(
                onTap: ref.watch(authUiControllerProvider).isPhoneFilled
                    ? () {
                        if (_formKey.currentState?.validate() ?? false) {
                          FocusScope.of(context).requestFocus(FocusNode());
                          ref
                              .read(sendOtpControllerProvider.notifier)
                              .sendOtp(number: _controller.text);
                        }
                      }
                    : null,
              ),
              35.verticalSpace,
              LoginPageTermsSection(),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
