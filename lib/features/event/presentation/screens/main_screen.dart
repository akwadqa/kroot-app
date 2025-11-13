import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/auth/application/auth_service.dart';
import 'package:kroot_app/features/event/presentation/screens/add_contact_screen.dart';
import 'package:kroot_app/features/event/presentation/screens/add_event_screen.dart';
import 'package:kroot_app/features/event/presentation/screens/event_details_screen.dart';
import 'package:kroot_app/features/event/presentation/screens/home_screen.dart';
import 'package:kroot_app/features/event/presentation/screens/invite_template_screen.dart';
import 'package:kroot_app/features/event/presentation/screens/qr_screen.dart';
import 'package:kroot_app/features/event/presentation/screens/send_invite_screen.dart';
import 'package:kroot_app/features/guests/presentation/screens/guests_screen.dart';
import 'package:kroot_app/features/profile/presentation/pages/pricing_screen.dart';
import 'package:kroot_app/features/profile/presentation/pages/profile_screen.dart';
import 'package:kroot_app/features/scan/presentation/pages/scan_page.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/bottm_navigation_bar_provider.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/bottom_navigation_bar_view.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';

import '../widgets/bottom_navigation_bar.dart';

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
    final List<Widget> _pages = [
      HomeScreen(),
      // SizedBox(),
      // GuestsScreen(),
      // PricingScreen(),
      ScanPage(),
      // EventDetailsScreen(),
      AddEventScreen(),
      ProfileScreen(),
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

    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: _pages[index],
      bottomNavigationBar: BottomNavigationBarView(),
    );
  }
}
