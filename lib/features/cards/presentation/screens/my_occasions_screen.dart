import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kroot_app/features/cards/presentation/widgets/my_occasions_screen_occasion_grid.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class MyOccasionsScreen extends StatelessWidget {
  const MyOccasionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
          title: context.tr('my_occasions'),
          withBackButton: false,
        ),
        body: const _MyOccasionsScreenBody());
  }
}

class _MyOccasionsScreenBody extends StatelessWidget {
  const _MyOccasionsScreenBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //? Title :
        Text(
          'select_event_type'.tr(),
          style: AppTextStyle.rubikMedium18.copyWith(color: AppColors.primary),
        ),

        //? Grid :
        MyOccasionsScreenOccasionsGrid()
        
      ],
    ).symmetricPadding(
      horizontal: 20,
      vertical: 10,
    );
  }
}
