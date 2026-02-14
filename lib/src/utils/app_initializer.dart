import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/src/notifications/notifications/services/notification_service.dart';

import '../../features/auth/application/auth_service.dart';

import '../../firebase_options.dart';
import '../constants/Api/services_urls.dart';
import '../riverpod_observer.dart';

abstract class AppInitializer {
  static Future<void> init() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await dotenv.load(fileName: '.env');

    ServicesUrls.init();

    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    await EasyLocalization.ensureInitialized();
  }
}

Future<ProviderContainer> initializeProviders() async {
  final container = ProviderContainer(observers: [RiverpodObserver()]);
  await container.read(sharedPreferencesProvider.future);
  await container.read(notificationsServiceProvider).init();
  return container;
}

Future<void> handleSplashScreen(ProviderContainer container) async {
  const minSplashDuration = 3000;
  final startTime = DateTime.now();

  final loadDuration = DateTime.now().difference(startTime).inMilliseconds;

  if (loadDuration < minSplashDuration) {
    await Future.delayed(
      Duration(milliseconds: minSplashDuration - loadDuration),
    );
  }

  FlutterNativeSplash.remove();
}
