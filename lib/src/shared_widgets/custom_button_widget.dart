import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wedding_app/src/extenssions/widget_extensions.dart';

import '../theme/app_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final Widget? content;
  final Color? backgroundColor;
  final Color? color;
  final VoidCallback? onTap;
  final bool isFiled;
  final double height;
  final double width;
  final double? radius;
  final double? topPading;
  const CustomButtonWidget({
    super.key,
    required this.text,
    this.backgroundColor,
    this.color,
    this.content,
    required this.onTap,
    required this.isFiled,
    required this.height,
    required this.width,
    this.radius,
    this.topPading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: backgroundColor ?? Colors.transparent,
          foregroundColor: AppColors.black900,
          fixedSize: Size(width, height),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: color ?? backgroundColor ?? Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(radius ?? 10),
          ),
        ),
        onPressed: onTap,
        child:
            content ??
            Text(
              context.tr(text),
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontSize: 16,
                color: isFiled ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ).centered(),
      ).onlyPadding(top: topPading ?? 0),
    );
  }
}
