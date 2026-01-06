import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../gen/fonts.gen.dart';
import 'app_colors.dart';

part 'app_theme.g.dart';

abstract class AppTheme {
  static const TextStyle _baseTextStyle = TextStyle(
    color: AppColors.black900,
    fontFamily: FontFamily.cairo,
    fontWeight: FontWeight.w600,
  );

  static const EdgeInsets _buttonPadding = EdgeInsets.all(16);

  static OutlineInputBorder _outlineBorder(Color borderColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: borderColor),
    );
  }

  static ThemeData lightTheme() {
    return ThemeData(
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.primary,
        selectionColor: AppColors.primary,
        selectionHandleColor: AppColors.primary,
      ),

      fontFamily: FontFamily.cairo,
      textTheme: TextTheme(
        displayLarge: _baseTextStyle.copyWith(fontSize: 24),
        displayMedium: _baseTextStyle.copyWith(fontSize: 20),
        displaySmall: _baseTextStyle.copyWith(fontSize: 16),
        bodyLarge: _baseTextStyle.copyWith(fontSize: 14),
        bodyMedium: _baseTextStyle.copyWith(fontSize: 12),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: _baseTextStyle.copyWith(fontSize: 22),
          elevation: 0,
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          padding: _buttonPadding,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          iconColor: AppColors.primary,
          textStyle: _baseTextStyle.copyWith(
            fontSize: 14,
            color: AppColors.black900,
          ),
          side: BorderSide(color: AppColors.border),
          padding: _buttonPadding,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: _outlineBorder(AppColors.grayBorder),
        border: _outlineBorder(AppColors.grayBorder),
        focusedBorder: _outlineBorder(AppColors.primary),
        labelStyle: _baseTextStyle.copyWith(
          color: AppColors.black900,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.black900,
          textStyle: _baseTextStyle.copyWith(fontSize: 18),
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
    );
  }
}

@Riverpod(keepAlive: true)
ThemeData appTheme(Ref ref) {
  return AppTheme.lightTheme();
}
