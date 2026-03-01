
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wedding_app/features/home/presentation/screens/home_screen.dart';
import 'package:wedding_app/features/profile/presentation/pages/profile_page.dart';
import 'package:wedding_app/gen/assets.gen.dart';
import 'package:wedding_app/src/theme/app_colors.dart';

import '../widgets/bottom_navigation_bar.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static final List<Widget> _pages = [
    HomeScreen(),
    // OrdersScreen(),
    // WalletScreen(),
    ProfilePage(),

    // Container()
    // ProfileScreen(),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
    return Scaffold(
      
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: _pages[_selectedIndex],
     
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        shape: const CircleBorder(),
        elevation: 10,
        onPressed: () {

          // TODO: navigate to Scan page
          // context.router.push(ScanQrCodeRoute());
        },
        child: Assets.icons.qr.svg(color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: AppBottomNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        onScanPressed: () {
          // context.router.push(ScanQrCodeRoute());
          // You can also trigger scan here if you prefer
        },
      ),
    );
  }
}