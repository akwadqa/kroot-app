import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_app/features/auth/application/auth_service.dart';
import 'package:wedding_app/features/event/presentation/screens/add_contact_screen.dart';
import 'package:wedding_app/features/event/presentation/screens/add_event_screen.dart';
import 'package:wedding_app/features/event/presentation/screens/event_details_screen.dart';
import 'package:wedding_app/features/event/presentation/screens/home_screen.dart';
import 'package:wedding_app/features/event/presentation/screens/invite_template_screen.dart';
import 'package:wedding_app/features/event/presentation/screens/qr_screen.dart';
import 'package:wedding_app/features/event/presentation/screens/send_invite_screen.dart';
import 'package:wedding_app/features/profile/presentation/pages/profile_page.dart';
import 'package:wedding_app/gen/assets.gen.dart';
import 'package:wedding_app/src/bottm_navigation_bar_provider.dart';
import 'package:wedding_app/src/routing/routes.dart';
import 'package:wedding_app/src/shared_widgets/bottom_navigation_bar_view.dart';
import 'package:wedding_app/src/theme/app_colors.dart';

import '../widgets/bottom_navigation_bar.dart';

// @RoutePage()
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
      SizedBox(),
      // EventDetailsScreen(),
      AddEventScreen(),
      SizedBox(),
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
