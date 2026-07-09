import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/src/localization/current_language.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class HomePageAppBar extends ConsumerWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final local = ref.watch(currentLanguageProvider);
    final name = ref
        .watch(homeControllerProvider)
        .value
        ?.utilsResponse
        ?.value
        ?.subscriber
        ?.mobile;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        32.verticalSpace,
        if (name != null)
          Row(
            children: [
              Text(
                context.tr('welcome'),
                style: AppTextStyle.rubikSemiBold16.copyWith(
                  color: AppColors.primary,
                ),
              ),
              12.horizontalSpace,
              Directionality(
                textDirection: ui.TextDirection.ltr,
                child: Text(
                  name != null ? '+$name' : '',
                  style: AppTextStyle.rubikSemiBold16.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
