import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kroot_app/features/app/app_service.dart';
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
  @override
  void initState() {
    Future(() {
      ref.read(currentLanguageProvider.notifier).getLanguage(context);
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await ref.read(appServiceProvider.notifier).checkAppVersion({});
      });
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
