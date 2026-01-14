import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/profile/presentation/controller/profile_controller.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/extenssions/int_extenssion.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/app_toast.dart';

class PricingScreen extends ConsumerWidget {
  const PricingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(profileControllerProvider).value?.index ?? 0;

    ref.listen(
      profileControllerProvider.select((val) => val.value!.paymentLink),
      (pre, next) {
        if (next is AsyncLoading) {
          AppAlert.showLoadingDialog(context);
        }

        if (next is AsyncData) {
          context.pop();
          context.push(Routes.payment, extra: next!.value);
        }
        if (next is AsyncError) {
          context.pop();
          AppToast.errorToast(next!.error.toString());
        }
      },
    );
    return Scaffold(
      appBar: CustomAppbar(title: context.tr('pricingServices')),

      body: Column(
        children: [
          30.verticalSpace,

          //? Tabs :
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PricingPageTabItem(tabIndex: 0, title: context.tr('basic')),
              PricingPageTabItem(tabIndex: 1, title: context.tr('special')),
              PricingPageTabItem(tabIndex: 2, title: context.tr('premium')),
            ],
          ),

          30.verticalSpace,

          //? Body :
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.easeInOut,
              transitionBuilder: (child, animation) {
                // يمكنك اختيار أي نوع حركة تحبه
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.1, 0), // يبدأ من اليمين قليلاً
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
              child: _buildTabContent(index),
            ),
          ),
        ],
      ).symmetricPadding(horizontal: 22.w),
    );
  }

  Widget _buildTabContent(int index) {
    switch (index) {
      case 0:
        return const PricingPageBasicSection(key: ValueKey(0));
      case 1:
        return const PricingPageSpecialSection(key: ValueKey(1));
      case 2:
        return const PricingPagePremiumSection(key: ValueKey(2));
      default:
        return const SizedBox.shrink();
    }
  }
}

class PricingPageBasicSection extends StatelessWidget {
  const PricingPageBasicSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr('basic'),
          style: AppTextStyle.rubikSemiBold16.copyWith(
            color: AppColors.primary,
          ),
        ),
        12.verticalSpace,
        Text(
          '${context.tr('startingFromSAR')} 70',
          style: AppTextStyle.rubikRegular14.copyWith(color: AppColors.primary),
        ),
        30.verticalSpace,
        PricingPageTermsItem(
          title: context.tr('sendInvitesThroughWhatsAppOrEmail'),
        ),
        PricingPageTermsItem(title: context.tr('RSVP')),
        PricingPageTermsItem(title: context.tr('uniqueQRCodeForEachGuest')),
        PricingPageTermsItem(title: context.tr('eventLocation')),
        PricingPageTermsItem(title: context.tr('scannerApp')),
        Spacer(),
        Consumer(
          builder: (context, ref, child) {
            return CustomButtonWidget(
              text: '',
              onTap: () {
                // context.push(Routes.payment);
                ref
                    .read(profileControllerProvider.notifier)
                    .getPaymentUrl('Basic', context.locale.languageCode);
              },
              isFiled: false,
              height: 44.h,
              width: double.infinity,
              content: Text(
                context.tr('tryForFree'),
                style: AppTextStyle.rubikSemiBold16.copyWith(
                  color: AppColors.white,
                ),
              ),
              backgroundColor: AppColors.primary,
            );
          },
        ),
        120.verticalSpace,
      ],
    );
  }
}

class PricingPageSpecialSection extends StatelessWidget {
  const PricingPageSpecialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr('special'),
          style: AppTextStyle.rubikSemiBold16.copyWith(
            color: AppColors.primary,
          ),
        ),
        12.verticalSpace,
        Text(
          '${context.tr('startingFromSAR')} 900',
          style: AppTextStyle.rubikRegular14.copyWith(color: AppColors.primary),
        ),
        30.verticalSpace,
        PricingPageTermsItem(title: context.tr('allFeaturesOfTheBasicPackage')),
        PricingPageTermsItem(title: context.tr('invitstionManagement')),
        PricingPageTermsItem(title: context.tr('sub-account')),
        PricingPageTermsItem(title: context.tr('freeDesigns')),
        PricingPageTermsItem(title: context.tr('replaceDeclineForFree')),
        PricingPageTermsItem(title: context.tr('scanningManagementAtTheEvent')),
        Spacer(),

        Consumer(
          builder: (context, ref, child) {
            return CustomButtonWidget(
              text: '',
              onTap: () {
                ref
                    .read(profileControllerProvider.notifier)
                    .getPaymentUrl('Special', context.locale.languageCode);
              },
              isFiled: false,
              height: 44.h,
              width: double.infinity,
              content: Text(
                context.tr('orderNow'),
                style: AppTextStyle.rubikSemiBold16.copyWith(
                  color: AppColors.white,
                ),
              ),
              backgroundColor: AppColors.primary,
            );
          },
        ),
        120.verticalSpace,
      ],
    );
  }
}

class PricingPagePremiumSection extends StatelessWidget {
  const PricingPagePremiumSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr('premium'),
          style: AppTextStyle.rubikSemiBold16.copyWith(
            color: AppColors.primary,
          ),
        ),
        12.verticalSpace,
        Text(
          '${context.tr('startingFromSAR')} 900',
          style: AppTextStyle.rubikRegular14.copyWith(color: AppColors.primary),
        ),
        30.verticalSpace,

        PricingPageTermsItem(title: context.tr('allFeaturesOfTheBasicPackage')),
        PricingPageTermsItem(title: context.tr('accountManagement')),
        PricingPageTermsItem(title: context.tr('usingAPrivteNumber')),
        PricingPageTermsItem(
          title: context.tr('invitationCustomizationOptions'),
        ),
        Spacer(),
        Consumer(
          builder: (context, ref, child) {
            return CustomButtonWidget(
              text: '',
              onTap: () {
                ref
                    .read(profileControllerProvider.notifier)
                    .getPaymentUrl('Premium', context.locale.languageCode);
              },
              isFiled: false,
              height: 44.h,
              width: double.infinity,
              content: Text(
                context.tr('connectWithUs'),
                style: AppTextStyle.rubikSemiBold16.copyWith(
                  color: AppColors.white,
                ),
              ),
              backgroundColor: AppColors.primary,
            );
          },
        ),
        120.verticalSpace,
      ],
    );
  }
}

class PricingPageTermsItem extends StatelessWidget {
  const PricingPageTermsItem({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Assets.icons.pricingCorrectIc.svg(),
        14.horizontalSpace,
        Text(title, style: AppTextStyle.rubikRegular14),
      ],
    ).onlyPadding(bottom: 22.h);
  }
}

class PricingPageTabItem extends ConsumerWidget {
  const PricingPageTabItem({
    super.key,
    required this.title,
    required this.tabIndex,
  });

  final int tabIndex;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(profileControllerProvider).value?.index;

    return GestureDetector(
      onTap: () {
        ref.read(profileControllerProvider.notifier).changeIndex(tabIndex);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        alignment: Alignment.center,
        height: 33.h,
        width: 91.w,
        decoration: BoxDecoration(
          color: index == tabIndex ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: .25),
              blurRadius: 4,
            ),
          ],
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: AppTextStyle.rubikRegular16.copyWith(
            color: index == tabIndex ? AppColors.white : AppColors.primary,
          ),
          child: Text(title),
        ),
      ),
    );
  }
}
