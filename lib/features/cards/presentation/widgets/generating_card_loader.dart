import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class GeneratingCardLoader extends StatefulWidget {
  const GeneratingCardLoader({super.key});

  @override
  State<GeneratingCardLoader> createState() => _GeneratingCardLoaderState();
}

class _GeneratingCardLoaderState extends State<GeneratingCardLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 1. الترس الدوار
          RotationTransition(
            turns: _controller,
            child: Icon(
              Icons.settings_suggest_rounded,
              color: AppColors.primary,
              size: 40,
            ),
          ),
          14.verticalSpace,

          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final opacity = 0.5 + (_controller.value - 0.5).abs();
              return Opacity(
                opacity: opacity,
                child: Text(
                  'generating_image'.tr(),
                  style: AppTextStyle.rubikMedium16.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
