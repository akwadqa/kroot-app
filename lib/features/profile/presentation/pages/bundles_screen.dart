import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/event/data/models/utils_response/utils_response.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/profile/presentation/controller/profile_controller.dart';
import 'package:kroot_app/src/extenssions/int_extenssion.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/app_toast.dart';

class BundlesScreen extends ConsumerWidget {
  const BundlesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bundles = ref
        .read(homeControllerProvider)
        .value!
        .utilsResponse!
        .value!
        .bundles!;

    final selectedBundle = ref
        .watch(profileControllerProvider)
        .value
        ?.bundleModel;

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
      appBar: CustomAppbar(title: context.tr('topUp')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            Text(
              context.tr('payment'),
              style: AppTextStyle.rubikSemiBold16.copyWith(
                color: AppColors.primary,
              ),
            ),
            12.verticalSpace,
            Text(
              context.tr('chooseYourPaymentPlan'),
              style: AppTextStyle.rubikRegular14.copyWith(
                color: AppColors.primary,
              ),
            ),
            15.verticalSpace,
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) =>
                    BundlePageBundleItem(bundleModel: bundles[index]),
                separatorBuilder: (_, __) => 20.verticalSpace,
                itemCount: bundles.length,
              ),
            ),

            CustomButtonWidget(
              text: '',
              backgroundColor: selectedBundle == null
                  ? AppColors.grayHint
                  : AppColors.primary,
              onTap: selectedBundle == null
                  ? () {}
                  : () {
                      ref
                          .read(profileControllerProvider.notifier)
                          .getPaymentUrl(
                            selectedBundle.name!,
                            context.locale.languageCode,
                          );
                    },
              isFiled: false,
              height: 50.h,
              content: Text(
                context.tr('checkout'),
                style: AppTextStyle.rubikSemiBold16.copyWith(
                  color: AppColors.white,
                ),
              ),
              width: double.infinity,
              radius: 10.r,
            ),
            113.verticalSpace,
          ],
        ),
      ),
    );
  }
}

class BundlePageBundleItem extends ConsumerWidget {
  const BundlePageBundleItem({super.key, required this.bundleModel});

  final BundleModel bundleModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedBundle = ref
        .watch(profileControllerProvider)
        .value
        ?.bundleModel;
    return GestureDetector(
      onTap: () {
        ref.read(profileControllerProvider.notifier).changeBundle(bundleModel);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        width: double.infinity,
        height: 51.h,
        decoration: BoxDecoration(
          color: selectedBundle?.price == bundleModel.price
              ? AppColors.lightBlue2.withValues(alpha: .56)
              : AppColors.grayField,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            Radio(
              value: bundleModel.price,
              enabled: true,
              groupValue: selectedBundle?.price,
              activeColor: AppColors.primary,
              onChanged: (bundle) {
                ref
                    .read(profileControllerProvider.notifier)
                    .changeBundle(bundleModel);
              },
            ),
            10.verticalSpace,
            Text(
              '${bundleModel.price} ${'with_currency'.tr()}',
              style: AppTextStyle.rubikRegular18.copyWith(
                color: AppColors.black,
              ),
            ),
            Spacer(),
            Text(
              '${bundleModel.amount} ${'cards'.tr()}',
              style: AppTextStyle.rubikRegular14.copyWith(
                color: selectedBundle?.price == bundleModel.price
                    ? AppColors.black
                    : AppColors.grayHint,
              ),
            ),
            16.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
