
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_language.g.dart';

@Riverpod(keepAlive: true)
class CurrentLanguage extends _$CurrentLanguage {
  @override
  String build() {
    return 'en';
  }

  void getLanguage(BuildContext context) {
    String? languageCode = context.savedLocale?.languageCode;
    if (languageCode != null) {
      state = languageCode;
    } else {
      state = 'en';
    }
  }

  void changeLanguage(BuildContext context, String languageCode) {
    EasyLocalization.of(context)!.setLocale(Locale(languageCode));
    state = languageCode;
  }
}
