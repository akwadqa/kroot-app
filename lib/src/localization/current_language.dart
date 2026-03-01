import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_language.g.dart';

@Riverpod(keepAlive: true)
class CurrentLanguage extends _$CurrentLanguage {
  @override
  String build() {
    return  PlatformDispatcher.instance.locale.languageCode;
  }

  void changeLanguage(BuildContext context, String languageCode) {
    context.setLocale(Locale(languageCode));
    state = languageCode;
  }
}
