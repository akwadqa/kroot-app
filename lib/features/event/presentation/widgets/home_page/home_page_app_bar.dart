import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wedding_app/src/localization/current_language.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';

class HomePageAppBar extends ConsumerWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final local = ref.watch(currentLanguageProvider);
    return Row(
      children: [
        //? App bar :
        Text(
          context.tr('welcome'),
          style: AppTextStyle.rubikSemiBold16.copyWith(
            color: AppColors.primary,
          ),
        ),
        Spacer(),
        Text(
          DateFormat('dd MMM yyyy', local).format(DateTime.now()),
          style: AppTextStyle.rubikMedium14.copyWith(color: AppColors.primary),
        ),
      ],
    );
  }
}
