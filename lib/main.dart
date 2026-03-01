import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wedding_app/features/app/app.dart';
import 'package:wedding_app/features/auth/application/auth_service.dart';
import 'src/riverpod_observer.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:device_preview/device_preview.dart';

import 'src/utils/app_initializer.dart';

Future<void> main() async {
  await AppInitializer.init();
  await dotenv.load(fileName: ".env");
  final container = await initializeProviders();
  await handleSplashScreen(container);

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => UncontrolledProviderScope(
        container: container,
        child: EasyLocalization(
          supportedLocales: const [Locale('en'), Locale('ar')],
          useOnlyLangCode: true, // Reduces logs and warnings
          path: 'assets/translations',
          child: const App(),
        ),
      ),
    ),
  );
}

Future<ProviderContainer> initializeProviders() async {
  final container = ProviderContainer(observers: [RiverpodObserver()]);
  await container.read(sharedPreferencesProvider.future);
  return container;
}

Future<void> handleSplashScreen(ProviderContainer container) async {
  const minSplashDuration = 2000;
  final startTime = DateTime.now();
  // await container.read(homeProvider.future);
  final loadDuration = DateTime.now().difference(startTime).inMilliseconds;

  if (loadDuration < minSplashDuration) {
    await Future.delayed(
      Duration(milliseconds: minSplashDuration - loadDuration),
    );
  }

  FlutterNativeSplash.remove();
}
