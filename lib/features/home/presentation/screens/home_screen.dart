import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedding_app/src/shared_widgets/bottom_navigation_bar_view.dart';
import 'package:wedding_app/features/auth/application/auth_service.dart';
import 'package:wedding_app/features/home/presentation/widgets/home_page/home_page_app_bar.dart';
import 'package:wedding_app/features/home/presentation/widgets/home_page/home_page_search_field.dart';
import 'package:wedding_app/gen/assets.gen.dart';
import 'package:wedding_app/src/shared_widgets/custom_appbar.dart';
import 'package:wedding_app/src/shared_widgets/custom_button_widget.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarView(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            44.verticalSpace,

            //? App bar :
            HomePageAppBar(),
            12.verticalSpace,

            //? Search field :
            HomePageSearchField(),
            20.verticalSpace,

            //? Title :
            Text(
              context.tr('allEvents'),
              style: AppTextStyle.rubikSemiBold18.copyWith(
                color: AppColors.primary,
              ),
            ),
            12.verticalSpace,
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                separatorBuilder: (context, index) => 12.verticalSpace,
                itemCount: 6,
                itemBuilder: (context, index) => HomePageEventItem(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageEventItem extends StatelessWidget {
  const HomePageEventItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 161.h,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.grayField,
      ),
      child: Row(
        children: [
          //? Image section :
          Container(
            width: 116.w,
            height: 137.h,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 0,
                  color: AppColors.black.withValues(alpha: .25),
                ),
              ],
              image: DecorationImage(
                image: Assets.images.weddingImage.provider(),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          12.horizontalSpace,

          //? Details :
          HomePageEventItemDetails(),
        ],
      ),
    );
  }
}

class HomePageEventItemDetails extends StatelessWidget {
  const HomePageEventItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        4.verticalSpace,
        Text(
          'Wed, 1-10-2025 08:00PM',
          style: AppTextStyle.rubikRegular12.copyWith(
            color: AppColors.blackText,
          ),
        ),
        Spacer(),

        //? Type :
        Text(
          'Wedding',
          style: AppTextStyle.rubikSemiBold16.copyWith(
            color: AppColors.primary,
          ),
        ),
        Spacer(),

        //? Names :
        Row(
          children: [
            Text(
              'Mohammed',
              style: AppTextStyle.rubikRegular14.copyWith(
                color: AppColors.blackText,
              ),
            ),
            3.horizontalSpace,
            Assets.images.ringsImage.image(width: 28.w),
            3.horizontalSpace,
            Text(
              'Nour',
              style: AppTextStyle.rubikRegular14.copyWith(
                color: AppColors.blackText,
              ),
            ),
          ],
        ),
        Spacer(),

        //? Location :
        Row(
          children: [
            Assets.icons.locationIc.svg(),
            5.horizontalSpace,
            Text(
              'Riffa Halls Hall No. 15',
              style: AppTextStyle.rubikRegular12.copyWith(
                color: AppColors.blackText,
              ),
            ),
          ],
        ),
        Spacer(),
        CustomButtonWidget(
          content: Text(
            'Confirmed',
            style: AppTextStyle.rubikRegular14.copyWith(color: AppColors.white),
          ),
          backgroundColor: AppColors.primary,
          text: '',
          radius: 32.r,
          onTap: () {},
          isFiled: false,
          height: 25.h,
          width: 83.w,
          topPading: 0,
        ),
      ],
    );
  }
}
