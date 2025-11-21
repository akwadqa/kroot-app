import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/profile/presentation/controller/profile_controller.dart';
import 'package:kroot_app/features/profile/presentation/widgets/profile_screen/change_language_bottom_sheet.dart';
import 'package:kroot_app/features/profile/presentation/widgets/profile_screen/profile_page_user_section_item.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/extenssions/int_extenssion.dart';
import 'package:kroot_app/src/localization/current_language.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late BuildContext ctx;
    ref.listen(profileControllerProvider, (pre, next) {
      if (next.value!.isLogout!) {
        if (next is AsyncLoading) {
          AppAlert.showLoadingDialog(ctx);
        }

        if (next is AsyncData) {
          ctx.pop();
          context.go(Routes.login);
        }
      }
    });
    return Scaffold(
      appBar: CustomAppbar(title: context.tr('profile'), withBackButton: false),
      body: Builder(
        builder: (context) {
          ctx = context;
          return Column(
            children: [
              20.verticalSpace,

              //? Title:
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 9.h),
                color: AppColors.lightGray02.withValues(alpha: .55),
                child: Text(
                  context.tr('user'),
                  style: AppTextStyle.rubikSemiBold18.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),

              //? User section settings :
              10.verticalSpace,
              ProfilePageUserSectionItem(
                title: context.tr('pricingServices'),
                icon: Assets.icons.pricingIc,
                onTap: () {
                  context.push(Routes.pricing);
                },
              ),

              //? Change language :
              ProfilePageUserSectionItem(
                title: context.tr('changeLanguage'),
                icon: Assets.icons.changeLanguageIc,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => ChangeLanguageBottomSheet(),
                  );
                },
              ),

              //? Delete user :
              ProfilePageUserSectionItem(
                title: context.tr('deleteUser'),
                icon: Assets.icons.deleteUserIc,
                onTap: () {
                  AppAlert.showGlobalDialog(
                    context: context,
                    title: context.tr('deleteUser'),
                    text: Text(
                      context.tr('deleteUserAlert'),
                      style: AppTextStyle.rubikRegular14.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    onSubmit: () {},
                  );
                },
              ),

              //? Logout :
              ProfilePageUserSectionItem(
                title: context.tr('logout'),
                icon: Assets.icons.logoutIc,
                onTap: () {
                  AppAlert.showGlobalDialog(
                    context: context,
                    isLogout: true,
                    title: context.tr('logout'),
                    text: Text(
                      context.tr('logoutAlert'),
                      style: AppTextStyle.rubikRegular14.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    onSubmit: () {
                      // context.
                      ref.read(profileControllerProvider.notifier).logout();
                    },
                  );
                },
              ),
              10.verticalSpace,

              //? Contact us :
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 9.h),
                color: AppColors.lightGray02.withValues(alpha: .55),
                child: Text(
                  context.tr('contactUs'),
                  style: AppTextStyle.rubikSemiBold18.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
              10.verticalSpace,

              //? Whats app :
              ProfilePageUserSectionItem(
                title: context.tr('+974 555 666'),
                icon: Assets.icons.contactWhatsappIc,
              ),
            ],
          );
        },
      ),
    );
  }
}
