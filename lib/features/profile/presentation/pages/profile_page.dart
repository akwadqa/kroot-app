// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:wedding_app/assets.gen.dart';
// import 'package:wedding_app/features/auth/application/auth_service.dart';
// import 'package:wedding_app/src/extenssions/int_extenssion.dart';
// import 'package:wedding_app/src/extenssions/widget_extensions.dart';
// import 'package:wedding_app/src/localization/current_language.dart';
// import 'package:wedding_app/src/shared_widgets/app_dialogs.dart';
// import 'package:wedding_app/src/shared_widgets/custom_button_widget.dart';

// class ProfilePage extends ConsumerWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context,WidgetRef ref) {
//     final theme = Theme.of(context);
//     final textTheme = theme.textTheme;
//     final storage =ref.read(userDataProvider);
//     // final name = storage?.$2;
//     // final email = storage?.$3;
//     // final initials = _initialsFromName(name);
//         final currentLanguage = ref.watch(currentLanguageProvider);
//     final currentLanguageNotifier = ref.read(currentLanguageProvider.notifier);
//     final String myLanguage = currentLanguage == 'en' ? 'en' : 'عربي';
//     return SafeArea(
//       child: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             _Header(
//               initials: initials,
//               title: name?.isNotEmpty == true ? name! : "—",
//               subtitle: email?.isNotEmpty == true ? email! : "—",
//             ),
//             16.verticalSpace,
//             Card(
//               elevation: 0,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16)),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _ProfileItem(
//                       label: "name".tr(),
//                       value: name ?? "—",
//                       leading: const Icon(Icons.person_outline),
//                     ),
//                     const Divider(height: 24),
//                     _ProfileItem(
//                       label: "email".tr(),
//                       value: email ?? "—",
//                       leading: const Icon(Icons.email),
//                       // trailing: IconButton(
//                       //   tooltip: tr("copy"),
//                       //   icon: const Icon(Icons.copy_rounded),
//                       //   onPressed: phone == null || phone.isEmpty
//                       //       ? null
//                       //       : () async {
//                       //           await Clipboard.setData(
//                       //               ClipboardData(text: phone));
//                       //           if (context.mounted) {
//                       //             ScaffoldMessenger.of(context).showSnackBar(
//                       //               SnackBar(
//                       //                   content:
//                       //                       Text(tr("تم النسخ "))),
//                       //             );
//                       //           }
//                       //         },
//                       // ),
                    
//                     ),
//                     const Divider(height: 24),
// // ⬇️ Language switcher row
// // const LanguageSwitcherTile(),
//   _ProfileItem(
//                       label: "language".tr(),
//                       // value: "—",
//                       leading: const Icon(Icons.language),
//            trailing:      LanguageSwitcher(
//             initialLanguage: myLanguage
            
//             ,
//             onLanguageChanged: (p0) {
//                  currentLanguageNotifier.changeLanguage(
//                             context, currentLanguage == 'ar' ? 'en' : 'ar'
//                           );
                          
//            },),
                    
//                     ),
// //  Row(
// //    children: [
// //     Text("label",
// //           style: theme.textTheme.bodyMedium?.copyWith(
// //             color: theme.colorScheme.onSurface,
// //           ),
// //         ),
// //         const Spacer(),
// //         const Icon(Icons.language),
// //      LanguageSwitcher(
// //             initialLanguage: myLanguage
            
// //             ,
// //             onLanguageChanged: (p0) {
// //                  currentLanguageNotifier.changeLanguage(
// //                             context, currentLanguage == 'ar' ? 'en' : 'ar'
// //                           );
                          
// //            },),
// //    ],
// //  )
                 
//                   ],
//                 ),
//               ),
//             ),
//             100.verticalSpace,
//             // Spacer(),
//             CustomButtonWidget(
//               onTap: () =>showLogoutDialog(context),
//               backgroundColor: Colors.red,
//               width: double.infinity,
//               height: 55,
//               content: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.logout_rounded,color: Colors.white,),
//                   10.horizontalSpace,
//                   Text(
//                     "logout".tr(),
//                     style: textTheme.displaySmall!.copyWith(
//                       color: Colors.white,
//                       fontSize: 15,
//                     ),
//                   ).centered(),
//                 ],
//               ), text: '', isFiled: true,
//             ).symmetricPadding(horizontal: 60),
//           ],
//         ),
//       ),
//     );
//   }

//   static String _initialsFromName(String? name) {
//     if (name == null || name.trim().isEmpty) return "👤";
//     final parts = name.trim().split(RegExp(r'\s+'));
//     final first = parts.isNotEmpty ? parts.first.characters.first : "";
//     final last = parts.length > 1 ? parts.last.characters.first : "";
//     final initials = (first + last).toUpperCase();
//     return initials.isEmpty ? "👤" : initials;
//   }

//   void _confirmLogout(BuildContext context) async {
//     final result = await showDialog<bool>(
//       context: context,
//       builder: (ctx) => AlertDialog(
//         title: Text(tr("logOut")),
//         content: Text(tr("logout_confirmation")),
//         shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(ctx).pop(false),
//             child: Text(tr("cancel")),
//           ),
//           // Spacer(),
//           20.horizontalSpace,
//           FilledButton(
//             onPressed: () => Navigator.of(ctx).pop(true),
//             child: Text(tr("logOut")),
//           ),
//         ],
//       ),
//     );
//     // if (result == true) {
//     //   sl<MainBloc>().add(LogOutEvent());
//     // }
//   }
// }

// class _Header extends StatelessWidget {
//   final String initials;
//   final String title;
//   final String subtitle;

//   const _Header({
//     required this.initials,
//     required this.title,
//     required this.subtitle,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         gradient: LinearGradient(
//           colors: [
//             theme.colorScheme.primary.withOpacity(0.10),
//             theme.colorScheme.primary.withOpacity(0.04),
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//       ),
//       child: Row(
//         children: [
//           CircleAvatar(
//             radius: 32,
//             backgroundColor: theme.colorScheme.primary.withOpacity(0.15),
//             child: Text(
//               initials,
//               style: theme.textTheme.titleMedium
//                   ?.copyWith(fontWeight: FontWeight.w700),
//             ),
//           ),
//           12.horizontalSpace,
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(title,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: theme.textTheme.titleMedium
//                         ?.copyWith(fontWeight: FontWeight.w700)),
//                 4.verticalSpace,
//                 Text(subtitle,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: theme.textTheme.bodyMedium
//                         ?.copyWith(color: theme.hintColor)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _ProfileItem extends StatelessWidget {
//   final String label;
//   final String? value;
//   final Widget? leading;
//   final Widget? trailing;

//   const _ProfileItem({
//     required this.label,
//      this.value,
//     this.leading,
//     this.trailing,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return ListTile(
//       contentPadding: EdgeInsets.zero,
//       leading: leading,
//       title: Text(label,
//           style: theme.textTheme.bodyMedium
//               ?.copyWith(fontWeight: FontWeight.w600)),
//       subtitle:value!=null? Text(value!, style: theme.textTheme.bodyLarge):null,
//       trailing: trailing,
//     );
//   }
// }

// class LanguageSwitcherTile extends ConsumerWidget {
//   const LanguageSwitcherTile({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final currentCode = ref.watch(currentLanguageProvider);               // e.g. 'en' / 'ar'
//     final currentLocale = Locale(currentCode);
//     final currentName = _localizedName(context, currentLocale);

//     return ListTile(
//       leading: const Icon(Icons.language),
//       title: Text(tr('language')),
//       subtitle: Text(currentName),
//       trailing: PopupMenuButton<Locale>(
//         tooltip: tr('choose_language'),
//         icon: const Icon(Icons.expand_more),
//         onSelected: (loc) async {
//            ref
//               .read(currentLanguageProvider.notifier)
//               .changeLanguage(context, loc.languageCode);                // <- uses your provider
//         },
//         itemBuilder: (ctx) {
//           return context.supportedLocales.map((loc) {
//             final name = _localizedName(context, loc);
//             final selected = loc.languageCode == currentCode;
//             return PopupMenuItem<Locale>(
//               value: loc,
//               child: Row(
//                 children: [
//                   if (selected) const Icon(Icons.check, size: 18),
//                   if (selected) const SizedBox(width: 6),
//                   Text(name),
//                 ],
//               ),
//             );
//           }).toList();
//         },
//       ),
//       onTap: () => _showLanguageSheet(context, ref, currentCode),        // optional bottom sheet
//     );
//   }

//   String _localizedName(BuildContext context, Locale loc) {
//     switch (loc.languageCode.toLowerCase()) {
//       case 'ar': return tr('arabic');   // e.g. "العربية"
//       case 'en':
//       default:  return tr('english');   // e.g. "English"
//     }
//   }

//   // Optional: nice bottom sheet picker (tap the tile to open)
//   void _showLanguageSheet(BuildContext context, WidgetRef ref, String currentCode) {
//     showModalBottomSheet(
//       context: context,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       builder: (_) {
//         return Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const SizedBox(height: 12),
//             Container(width: 40, height: 4,
//               decoration: BoxDecoration(
//                 color: Colors.black26, borderRadius: BorderRadius.circular(2),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: Text(tr('choose_language'),
//                   style: Theme.of(context).textTheme.titleMedium),
//             ),
//             const Divider(height: 1),

//             ...context.supportedLocales.map((loc) {
//               final selected = loc.languageCode == currentCode;
//               return RadioListTile<String>(
//                 value: loc.languageCode,
//                 groupValue: currentCode,
//                 title: Text(_localizedName(context, loc)),
//                 onChanged: (val) async {
//                   if (val == null) return;
//                    ref.read(currentLanguageProvider.notifier)
//                     .changeLanguage(context, val);
//                   if (context.mounted) Navigator.pop(context);
//                 },
//                 secondary: Icon(
//                   Icons.flag,
//                   color: loc.languageCode == 'ar' ? Colors.green : Colors.blue,
//                 ),
//                 selected: selected,
//               );
//             }).toList(),
//             const SizedBox(height: 8),
//           ],
//         );
//       },
//     );
//   }
// }

// class LanguageSwitcher extends StatefulWidget {
//   final Function(String) onLanguageChanged;
//   final String initialLanguage;

//   const LanguageSwitcher({
//     Key? key,
//     required this.onLanguageChanged,
//     this.initialLanguage = 'en',
//   }) : super(key: key);

//   @override
//   State<LanguageSwitcher> createState() => _LanguageSwitcherState();
// }

// class _LanguageSwitcherState extends State<LanguageSwitcher>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _slideAnimation;
//   late String currentLanguage;

//   @override
//   void initState() {
//     super.initState();
//     currentLanguage = widget.initialLanguage;

//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );

//     _slideAnimation = Tween<double>(
//       begin: currentLanguage == 'en' ? 0.0 : 1.0,
//       end: currentLanguage == 'en' ? 0.0 : 1.0,
//     ).animate(CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     ));
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   void _toggleLanguage() {
//     setState(() {
//       currentLanguage = currentLanguage == 'en' ? 'ar' : 'en';
//     });

//     _slideAnimation = Tween<double>(
//       begin: _slideAnimation.value,
//       end: currentLanguage == 'en' ? 0.0 : 1.0,
//     ).animate(CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     ));

//     _animationController.forward(from: 0.0);
//     widget.onLanguageChanged(currentLanguage);
//   }

//   Widget _buildQatarFlag() {
//     return ClipOval(
//       child: Container(
//         width: 24,
//         height: 24,
//         decoration: BoxDecoration(
//           color:const Color.fromARGB(255, 112, 55, 72), 
//           shape: BoxShape.circle,
//         ),
//         child:
//         Image.asset(        "assets/images/qatar_circl.jpeg"
// )
//           // Assets .images.qa.image(),
        
        
//         //  Text(
//         //   "🇶🇦",
//         //   style: TextStyle(fontSize: 20),
          
//         // )
//       ),
//     );
//   }

//   Widget _buildBritishFlag() {
//     return ClipOval(
//       child: Container(
//         width: 24,
//         height: 24,
//         decoration: BoxDecoration(
//           color: const Color(0xFF012169),
//           shape: BoxShape.circle,
//         ),
//         child:
        
        
//          Text(
//           "🇬🇧",
//           style: TextStyle(fontSize: 20),
          
//         )
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _toggleLanguage,
//       child: SizedBox(
//         width: 80,
//         height: 40,
//         child: Card.outlined(
//           color: Colors.grey[300],
//           elevation: 4,
//           shape: OutlineInputBorder(
//             borderSide: BorderSide(color:Colors.white ),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           // decoration: BoxDecoration(
//           //   color: Colors.grey[300],
//           //   borderRadius: BorderRadius.circular(20),
//           // ),
//           child: Row(
//             children: [
//               // Circular flag icon
//               Container(
//                 width: 36,
//                 height: 36,
//                 // margin: const EdgeInsets.all(2),
//                 // decoration: BoxDecoration(
//                 //   color: Colors.white,
//                 //   shape: BoxShape.circle,
//                 //   boxShadow: [
//                 //     BoxShadow(
//                 //       color: Colors.black.withOpacity(0.15),
//                 //       blurRadius: 4,
//                 //       offset: const Offset(0, 2),
//                 //     ),
//                 //   ],
//                 // ),
//                 child: Center(
//                   child: currentLanguage == 'en'
//                       ? _buildQatarFlag()
//                       : _buildBritishFlag(),
//                 ),
//               ),
//               // Language text
//               Expanded(
//                 child: Center(
//                   child: Text(
//                     currentLanguage == 'en' ?   'عربي':'EN',
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black87,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
