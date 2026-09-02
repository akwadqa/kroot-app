import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kroot_app/features/app/presentation/controller/app_controller.dart';
import 'package:toastification/toastification.dart';
import 'package:kroot_app/src/routing/go_router_app.dart';

import '../../src/localization/current_language.dart';
import '../../src/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  bool _isLanguageSynced = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // هذا الكود يتنفذ قبل أن تبدأ أي شاشة بطلب بيانات من الـ API
    if (!_isLanguageSynced) {
      // نقرأ اللغة المحفوظة في easy_localization مباشرة بشكل متزامن
      final currentLang = context.locale.languageCode;

      // نحدث حالة الـ Riverpod فوراً (نستخدم microtask لتجنب أخطاء بناء الواجهة)
      Future.microtask(() {
        ref.read(currentLanguageProvider.notifier).syncLanguage(currentLang);
      });

      _isLanguageSynced = true;
    }
  }

  @override
  void initState() {
    Future.microtask(() {
      ref.read(appControllerProvider.notifier).checkAppVersion();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final goRouter = ref.watch(goRouterProvider);
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: ToastificationWrapper(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: goRouter,
          theme: ref.watch(appThemeProvider),
          onGenerateTitle: (context) => context.tr('appTitle'),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        ),
      ),
    );
  }
}
