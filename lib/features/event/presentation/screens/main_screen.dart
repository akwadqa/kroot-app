import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/event/presentation/screens/add_event_screen.dart';
import 'package:kroot_app/features/event/presentation/screens/home_screen.dart';
import 'package:kroot_app/features/profile/presentation/pages/profile_screen.dart';
import 'package:kroot_app/features/scan/presentation/pages/scan_page.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/bottm_navigation_bar_provider.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/bottom_navigation_bar_view.dart';
import 'package:kroot_app/features/event/presentation/screens/manage_access_page.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/app_toast.dart';

//
class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  // int _selectedIndex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  // DateTime? _lastBackPressed;
  // Future<bool> _onWillPop() async {
  //   final now = DateTime.now();
  //   if (_lastBackPressed == null ||
  //       now.difference(_lastBackPressed!) >= const Duration(seconds: 2)) {
  //     _lastBackPressed = now;
  //     Fluttertoast.showToast(
  //       msg: 'click_again_to_exit'.tr(),
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       backgroundColor: Colors.black87,
  //       textColor: Colors.white,
  //       fontSize: 16.0,
  //     );
  //     return false;
  //   }
  //   return true;
  // }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeScreen(),
      // SizedBox(),
      // GuestsScreen(),
      // PricingScreen(),
      ScanPage(),
      // EventDetailsScreen(),
      // AddEventScreen(),
      ProfileScreen(),

      // SizedBox(),
      // ManageAccessPage(),
      // Center(child: MailPulseAnimation()),
      SizedBox(),

      // SizedBox(),
      // Center(
      //   child: CustomButtonWidget(
      //     text: 'Logout',
      //     onTap: () {
      //       ref.read(userDataProvider.notifier).removeData().whenComplete(() {
      //         context.pushReplacement(Routes.login);
      //       });
      //     },
      //     isFiled: false,
      //     height: 44.h,
      //     width: 330.w,
      //     backgroundColor: AppColors.primary,
      //   ),
      // ),
      // AddContactScreen(),
      // InviteTemplateScreen(),
      // QrScreen(),
      // SendInviteScreen(),
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
          // context.push(Routes.createEvent);
          if (controller?.error != null) {
            // AppToast.errorToast(controller!.error.toString());
            AppToast.errorToast('Please wait');
            ref.read(homeControllerProvider.notifier).getUtils();
          }
          if (controller?.isLoading ?? false) {
            AppToast.errorToast('Please wait');
          }
          if (controller?.value != null) {
            final data = controller!.value;

            if ((data?.subscriber?.remainingBalance ?? 0) == 0) {
              //   ref.read(bottomNavIndexProvider.notifier).setIndex(index);
              // } else {
              AppToast.errorToast(
                'There is no kroot remaining in your account',
              );
            } else {
              context.push(Routes.createEvent);
              // ref.read(bottomNavIndexProvider.notifier).setIndex(index);
            }
          }
        },
        child: Container(
          width: 70.w,
          height: 70.w,
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
