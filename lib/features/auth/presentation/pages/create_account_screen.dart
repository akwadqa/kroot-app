import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_app/features/auth/presentation/controller/auth_controller.dart';
import 'package:wedding_app/features/auth/presentation/controller/auth_ui_controller.dart';
import 'package:wedding_app/features/auth/presentation/controller/send_otp_controller.dart';
import 'package:wedding_app/features/auth/presentation/widgets/create_account_page/create_account_field.dart';
import 'package:wedding_app/features/auth/presentation/widgets/create_account_page/create_account_page_confirm_button.dart';
import 'package:wedding_app/features/auth/presentation/widgets/create_account_page/create_account_terms.dart';
import 'package:wedding_app/gen/assets.gen.dart';
import 'package:wedding_app/src/extenssions/int_extenssion.dart';
import 'package:wedding_app/src/extenssions/widget_extensions.dart';
import 'package:wedding_app/src/routing/routes.dart';
import 'package:wedding_app/src/shared_widgets/custom_appbar.dart';
import 'package:wedding_app/src/shared_widgets/custom_button_widget.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';
import 'package:wedding_app/src/utils/app_alert.dart';

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
    //? Listener for create account :
    ref.listen(authControllerProvider, (prev, next) {
      if (next is AsyncError) {
        context.pop();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.error.toString())));
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

    //? Listener for navigate to verify page :
    ref.listen(sendOtpControllerProvider, (prev, next) {
      if (next is AsyncError) {
        context.pop();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.error.toString())));
      }

      //? We don't need here a loading because we didn't pop last loading 

      if (next is AsyncData) {
        context.pop();
        ref
            .read(authUiControllerProvider.notifier)
            .makeResendButtonVisibleOrNo(false);
        context.push(Routes.verification, extra: widget.number);
      }
    });

    return Scaffold(
      appBar: CustomAppbar(title: context.tr('newAccount')),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              35.verticalSpace,

              //? Title :
              Text(
                context.tr('weCreateNewAccount'),
                style: AppTextStyle.rubikRegular16.copyWith(
                  color: AppColors.primary,
                ),
              ),
              Text(widget.number, style: AppTextStyle.rubikSemiBold16),
              21.verticalSpace,

              //? First name :
              CreataAccountField(
                controller: _firstNameController,
                icon: Assets.icons.firstNamePersonIc,
                hint: context.tr('enterFirstName'),
                isRequired: true,
                label: context.tr('firstName'),
              ),
              20.verticalSpace,

              //? Last name :
              CreataAccountField(
                controller: _lastNameController,
                icon: Assets.icons.lastNamePersonIc,
                hint: context.tr('enterLastName'),
                isRequired: true,
                label: context.tr('lastName'),
              ),
              20.verticalSpace,

              //? Enter email :
              CreataAccountField(
                controller: _emailController,
                icon: Assets.icons.enterEmailIc,
                hint: 'user@gmail.com',
                isRequired: false,
                label: context.tr('email'),
              ),
              20.verticalSpace,

              //? Terms :
              CreateAccountTerms(),
              35.verticalSpace,

              //? Confirm button :
              CreateAccountPageConfirmButton(
                onTap: () {
                  if (_key.currentState!.validate()) {
                    ref
                        .read(authControllerProvider.notifier)
                        .creataAccount(
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
