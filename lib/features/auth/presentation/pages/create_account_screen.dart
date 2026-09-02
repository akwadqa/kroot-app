import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/auth/presentation/controller/auth_controller.dart';
import 'package:kroot_app/features/auth/presentation/controller/auth_ui_controller.dart';
import 'package:kroot_app/features/auth/presentation/controller/send_otp_controller.dart';
import 'package:kroot_app/features/auth/presentation/widgets/create_account_page/create_account_app_bar.dart';
import 'package:kroot_app/features/auth/presentation/widgets/create_account_page/create_account_field.dart';
import 'package:kroot_app/features/auth/presentation/widgets/create_account_page/create_account_page_confirm_button.dart';
import 'package:kroot_app/features/auth/presentation/widgets/create_account_page/create_account_terms.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/extenssions/int_extenssion.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/app_toast.dart';

class CreateAccountScreen extends ConsumerStatefulWidget {
  const CreateAccountScreen({required this.number, super.key});

  final String number;

  @override
  ConsumerState<CreateAccountScreen> createState() =>
      _CreateAccountScreenState();
}

class _CreateAccountScreenState extends ConsumerState<CreateAccountScreen> {
  final _key = GlobalKey<FormState>();

  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authControllerProvider.select((val)=>val.value!.createAccountResponse), (prev, next) {
      if (next is AsyncError) {
        context.pop();
        AppToast.errorToast(next?.error.toString() ?? 'error'.tr());
      }

      if (next is AsyncLoading) {
        AppAlert.showLoadingDialog(context);
      }

      if (next is AsyncData) {
        ref
            .read(sendOtpControllerProvider.notifier)
            .sendOtp(number: widget.number);
      }
    });

    ref.listen(sendOtpControllerProvider, (prev, next) {
      if (next is AsyncError) {
        context.pop();
        AppToast.errorToast(next.error.toString());
      }

      if (next is AsyncData) {
        context.pop();
        ref
            .read(authUiControllerProvider.notifier)
            .makeResendButtonVisibleOrNo(false);

        context.push(Routes.verification, extra: widget.number);
      }
    });

    return Scaffold(
      appBar: CreateAccountAppBar(title: context.tr('newAccount')),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              35.verticalSpace,
              Text(
                context.tr('weCreateNewAccount'),
                style: AppTextStyle.rubikRegular16.copyWith(
                  color: AppColors.primary,
                ),
              ),
              Text(widget.number,
                  textDirection: ui.TextDirection.ltr,
                  style: AppTextStyle.rubikSemiBold16),
              21.verticalSpace,
              AppTextFormField(
                controller: _firstNameController,
                icon: Assets.icons.firstNamePersonIc,
                hint: context.tr('enterFirstName'),
                isRequired: true,
                label: context.tr('firstName'),
              ),
              20.verticalSpace,
              AppTextFormField(
                controller: _lastNameController,
                icon: Assets.icons.lastNamePersonIc,
                hint: context.tr('enterLastName'),
                isRequired: true,
                label: context.tr('lastName'),
              ),
              20.verticalSpace,
              AppTextFormField(
                controller: _emailController,
                icon: Assets.icons.enterEmailIc,
                hint: 'user@gmail.com',
                isRequired: false,
                label: context.tr('email'),
              ),
              20.verticalSpace,
              CreateAccountTerms(),
              35.verticalSpace,
              CreateAccountPageConfirmButton(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (_key.currentState!.validate()) {
                    ref.read(authControllerProvider.notifier).creataAccount(
                          number: widget.number,
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text,
                          email: _emailController.text,
                        );
                  }
                },
              ),
            ],
          ).symmetricPadding(horizontal: 22.w),
        ),
      ),
    );
  }
}
