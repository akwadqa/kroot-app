import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kroot_app/features/app/app.dart';
import 'package:device_preview/device_preview.dart';
import 'package:screen_protector/screen_protector.dart';
import 'src/utils/app_initializer.dart';

Future<void> main() async {
  await AppInitializer.init();
  await ScreenProtector.preventScreenshotOn();
  await ScreenProtector.protectDataLeakageWithColor(Colors.black);
  final container = await initializeProviders();
  await handleSplashScreen(container);
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => UncontrolledProviderScope(
        container: container,
        child: EasyLocalization(
          supportedLocales: const [Locale('en'), Locale('ar')],
          useOnlyLangCode: true,
          path: 'assets/translations',
          child: const App(),
        ),
      ),
    ),
  );
}
