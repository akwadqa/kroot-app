import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/cards/presentation/screens/my_occasions_screen.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/event/presentation/screens/home_screen.dart';
import 'package:kroot_app/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:kroot_app/features/profile/presentation/pages/profile_screen.dart';
import 'package:kroot_app/features/scan/presentation/pages/scan_page.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/bottm_navigation_bar_provider.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/bottom_navigation_bar_view.dart';
import 'package:kroot_app/src/utils/app_toast.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeScreen(),

      ScanPage(),

      // NotificationsScreen(),
      ProfileScreen(),
      MyOccasionsScreen()
    ];
    final index = ref.watch(bottomNavIndexProvider);
    final controller = ref.watch(
      homeControllerProvider.select((val) => val.value!.utilsResponse),
    );

    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
          if (controller?.error != null) {
            AppToast.errorToast('Please wait');
            ref.read(homeControllerProvider.notifier).getUtils();
          }
          if (controller?.isLoading ?? false) {
            AppToast.errorToast('Please wait');
          }
          if (controller?.value != null) {
            final data = controller!.value;

            if ((data?.subscriber?.remainingBalance ?? 0) == 0) {
              AppToast.errorToast(
                'There is no kroot remaining in your account'.tr(),
              );
            } else {
              context.push(Routes.createEvent);
            }
          }
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xff15294B),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 12,
                color: Colors.black.withOpacity(.25),
              ),
            ],
          ),
          child: Center(child: Assets.icons.addEventIc.svg()),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: pages[index],
      bottomNavigationBar: BottomNavigationBarView(),
    );
  }
}
