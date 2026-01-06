import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/theme/app_colors.dart';

class AppBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;
  final VoidCallback onScanPressed;

  const AppBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.onScanPressed,
  });

  @override
  Widget build(BuildContext context) {
    final icons = [Assets.icons.home.path, Assets.icons.profile.path];

    return AnimatedBottomNavigationBar.builder(
      itemCount: icons.length,

      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.sharpEdge,

      leftCornerRadius: 20,
      rightCornerRadius: 20,

      backgroundColor: AppColors.halfWhite,
      activeIndex: selectedIndex,
      splashColor: AppColors.primary,
      onTap: onItemTapped,
      tabBuilder: (index, isActive) {
        final color = isActive ? AppColors.primary : Colors.grey;
        final title = index == 0 ? 'home'.tr() : 'profile'.tr();

        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(icons[index], color: color),
              const SizedBox(height: 4),
              Text(title, style: TextStyle(fontSize: 12, color: color)),
            ],
          ),
        );
      },
    );
  }
}
