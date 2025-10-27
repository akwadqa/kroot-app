// import 'dart:ui';
// import 'package:auto_route/auto_route.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:wedding_app/gen/assets.gen.dart';
// import 'package:wedding_app/src/extenssions/int_extenssion.dart';
// import 'package:wedding_app/src/extenssions/widget_extensions.dart';
// import 'package:wedding_app/src/theme/app_colors.dart';

// class CustomBottomNavigationBar extends ConsumerWidget {
//   final int selectedIndex;
//   final ValueChanged<int> onItemTapped;

//   const CustomBottomNavigationBar({
//     super.key,
//     required this.selectedIndex,
//     required this.onItemTapped,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {

//     return
//          ClipRRect(
//             clipBehavior: Clip.hardEdge,
//             borderRadius: BorderRadius.circular(20),
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//               child: Container(
//                 height: 100,
//                 decoration: BoxDecoration(
//                   color: Colors.white
//                       .withOpacity(0.5), // Light white tint over blur
//                   borderRadius: BorderRadius.circular(20),
//                   border: Border.all(color: AppColors.border, width: 1),
//                   // boxShadow: [
//                   //   BoxShadow(
//                   //     color: Colors.black.withOpacity(0.1), // Soft bottom shadow
//                   //     offset: Offset(0, 4),
//                   //     blurRadius: 10,
//                   //     spreadRadius: 0,
//                   //   ),
//                   // ],
//                 ),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     _buildNavItem(Assets.icons.home, "home", 0, context),

//                   _buildCentralItem(ref,context),

//                     _buildNavItem(Assets.icons.profile, "profile", 1, context),
//                   ],
//                 ).symmetricPadding(
//                   horizontal: 15,
//                 ),
//               ),
//             ),
//           ).onlyPadding(bottom: 20.0, start: 20, end: 20);
//   }

//   Widget _buildNavItem(
//       SvgGenImage icon, String title, int index, BuildContext context) {
//     return GestureDetector(
//       onTap: () => onItemTapped(index),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           icon.svg(
//             height: 30,
//             width: 30,
//             color: selectedIndex == index ? AppColors.primary : AppColors.gray,
//           ),
//           4.verticalSpace,
//           Text(
//             context.tr(title),
//             style:
//                 Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildCentralItem(WidgetRef ref,BuildContext context) {
//     return GestureDetector(
//       onTap: () async {
//       // context.router.push(ScanDriverQrRoute());
//       },
//       child: Container(
//         height: 50,
//         width: 50,
//         padding: EdgeInsets.all(10),
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(16)),
//           color: Colors.black,
//           shape: BoxShape.rectangle,
//         ),
//         child: Assets.icons.qr.svg(
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedding_app/gen/assets.gen.dart';
import 'package:wedding_app/src/theme/app_colors.dart';

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
      // elevation: 20,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.sharpEdge,
// blurEffect: true,

      leftCornerRadius: 20,
      rightCornerRadius: 20,
      // height: 70,
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
              SvgPicture.asset(
                icons[index],
                // height: 26,
                // width: 26,
                color: color,
              ),
              const SizedBox(height: 4),
              Text(title, style: TextStyle(fontSize: 12, color: color)),
            ],
          ),
        );
      },
    );
  }
}
