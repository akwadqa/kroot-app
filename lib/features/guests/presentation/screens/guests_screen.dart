// features/guests/presentation/pages/guests_page.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedding_app/features/event/presentation/controller/home_ui_controller.dart';
import 'package:wedding_app/features/event/presentation/widgets/home_page/home_page_search_field.dart';
import 'package:wedding_app/features/guests/presentation/controller/guest_ui_controller.dart';
import 'package:wedding_app/features/guests/presentation/widgets/guests_list/guests_screen_tab_bar.dart';
import 'package:wedding_app/features/guests/presentation/widgets/guests_list/guests_screen_tabs_item.dart';
import 'package:wedding_app/features/guests/presentation/widgets/search_field.dart';
import 'package:wedding_app/gen/assets.gen.dart';
import 'package:wedding_app/src/extenssions/int_extenssion.dart';
import 'package:wedding_app/src/extenssions/widget_extensions.dart';
import 'package:wedding_app/src/shared_widgets/app_pagination_widget.dart';
import 'package:wedding_app/src/shared_widgets/custom_appbar.dart';
import 'package:wedding_app/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';
import 'package:wedding_app/src/utils/app_alert.dart';

import '../controller/guests_controller.dart';
import '../widgets/status_filter_bar.dart';
import '../widgets/guest_tile.dart';
import 'guest_details_page.dart';

class GuestsScreen extends ConsumerStatefulWidget {
  const GuestsScreen({super.key});

  @override
  ConsumerState<GuestsScreen> createState() => _GuestsScreenState();
}

class _GuestsScreenState extends ConsumerState<GuestsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: context.tr('all_guests')),
      body: Column(
        children: [
          //? Search field :
          HomePageSearchField(
            hint: context.tr('search'),
          ).symmetricPadding(horizontal: 22.w, vertical: 23.h),

          //? Tabs :
          GuestsScreenTabBar(),

          //? Guests list
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) =>
                  Divider(color: AppColors.lightGray02.withValues(alpha: .4)),
              itemBuilder: (context, index) =>
                  GuestsScreenGuestItem(index: index),
              itemCount: 8,
            ),
          ),
        ],
      ),
    );
  }
}

class GuestsScreenGuestItem extends ConsumerWidget {
  const GuestsScreenGuestItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(guestUiControllerProvider).index;

    return ListTile(
      leading: GestureDetector(
        onTap: () {
          AppAlert.showGlobalDialog(
            context: context,
            title: context.tr('deleteGuest'),
            onSubmit: () {},
            text: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text: context.tr('sureRemoveContact1'),
                    style: AppTextStyle.rubikRegular14.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  TextSpan(
                    text: 'Ahmed Al-Ahmed',
                    style: AppTextStyle.rubikMedium14.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  TextSpan(
                    text: context.tr('sureRemoveContact2'),
                    style: AppTextStyle.rubikRegular14.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          );
        },

        child: Assets.icons.xGuestIc.svg(),
      ),
      title: Text(
        'Ahemd Al-Ahmed',
        style: AppTextStyle.rubikRegular16.copyWith(color: AppColors.black),
      ),
      trailing: tabIndex == 0
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: index & 3 == 0
                    ? AppColors.confirmGuest
                    : index & 3 == 1
                    ? AppColors.waitingGuest
                    : AppColors.noticeRed,

                borderRadius: BorderRadius.circular(32.r),
              ),
              child: Text(
                index & 3 == 0
                    ? context.tr('status_confirmed')
                    : index & 3 == 1
                    ? context.tr('waiting')
                    : context.tr('rejected'),
                style: AppTextStyle.rubikRegular14.copyWith(
                  color: AppColors.white,
                ),
              ),
            )
          : null,
    );
  }
}

  // final _scroll = ScrollController();

  // @override
  // void initState() {
  //   super.initState();
  //   _scroll.addListener(() {
  //     if (_scroll.position.pixels > _scroll.position.maxScrollExtent - 200) {
  //       ref.read(guestsControllerProvider.notifier).loadNextPage();
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   _scroll.dispose();
  //   super.dispose();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   final async = ref.watch(guestsControllerProvider);
  //   final ctrl = ref.read(guestsControllerProvider.notifier);

  //   return Scaffold(
  //     appBar: PreferredSize(
  //       preferredSize: Size(double.infinity, 65),
  //       child: CustomAppbar(title: tr("all_guests")),
  //     ),
  //     body: Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       // controller: _scroll,
  //       children: [
  //         GuestsSearchField(
  //           hint: tr('guest_name'), // "اسم الضيف"
  //           onChanged: ctrl.setQuery,
  //         ),
  //         const SizedBox(height: 12),
  //         StatusFilterBar(onChanged: ctrl.setStatus),
  //         async.when(
  //           data: (items) => items.isEmpty
  //               ? Column(
  //                   children: [
  //                     Assets.images.imErrorScreen.image(),
  //                     25.verticalSpace,
  //                     Text(tr('no_results')),
  //                   ],
  //                 )
  //               : Expanded(
  //                   child: AppPaginationWidget(
  //                     enablePullDown: true,
  //                     onRefresh: () async => await ctrl.refreshGuests(),
  //                     onLoading: (page) async => await ctrl.loadNextPage(),
  //                     child: ListView.separated(
  //                       itemCount: items.length,
  //                       separatorBuilder: (_, c) => const Divider(
  //                         height: 1,
  //                         color: AppColors.lightGray,
  //                         thickness: 1,
  //                       ),
  //                       itemBuilder: (_, i) {
  //                         final g = items[i];
  //                         return GuestTile(
  //                           guest: g,
  //                           onTap: () => {
  //                             // context.pushRoute(GuestDetailsRoute(guest: g))
  //                             //   Navigator.of(context).push(
  //                             //   MaterialPageRoute(
  //                             //     builder: (_) => GuestDetailsPage(guestId: g.id),
  //                             //   ),
  //                             // ),
  //                           },
  //                         );
  //                       },
  //                     ),
  //                   ),
  //                 ),
  //           loading: () => Padding(
  //             padding: EdgeInsets.only(top: 250),
  //             child: Center(child: FadeCircleLoadingIndicator()),
  //           ),
  //           error: (e, _) => Padding(
  //             padding: EdgeInsets.only(bottom: 300),
  //             child: Center(child: Text(e.toString())),
  //           ),
  //         ),

  //         // Padding(
  //         //   padding: EdgeInsets.only(bottom: 300),
  //         //   child: Center(
  //         //     child: async.maybeWhen(
  //         //       data: (d) => d.isEmpty
  //         //           ? Text(tr('no_results'))
  //         //           : const SizedBox.shrink(),
  //         //       orElse: () => const SizedBox.shrink(),
  //         //     ),
  //         //   ),
  //         // ),
  //       ],
  //     ),
  //   );
  

//
//
// class GuestsScreen extends ConsumerStatefulWidget {
//   const GuestsScreen({super.key});

//   @override
//   ConsumerState<GuestsScreen> createState() => _GuestsScreenState();
// }

// class _GuestsScreenState extends ConsumerState<GuestsScreen> {
//   // local visual state for which tab looks selected
//   RsvpStatus? _selected;

//   @override
//   Widget build(BuildContext context) {
//     final async = ref.watch(guestsControllerProvider);
//     final ctrl  = ref.read(guestsControllerProvider.notifier);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         centerTitle: true,
//         title: Text(tr('all_guests')),
//       ),
//       body: async.when(
//         loading: () => const Center(child: Assets.images.animationLoading.image()),
//         error: (e, _) => Center(child: Text(e.toString())),
//         data: (items) {
//           return
// AppPaginationWidget(
//             enablePullDown: true,
//             onRefresh: () async => await ctrl.refreshGuests(),
//             onLoading: (page) async => await ctrl.loadNextPage(),
//             child: ListView.separated(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               // +1 for the header card
//               itemCount: items.length + 1,
//               separatorBuilder: (_, __) => const Divider(height: 1),
//               itemBuilder: (context, index) {
//                 if (index == 0) {
//                   return _HeaderCard(
//                     selected: _selected,
//                     onSelect: (s) {
//                       setState(() => _selected = s);
//                       ctrl.setStatus(s); // null = all
//                     },
//                     onQuery: ctrl.setQuery, // debounced in controller
//                   );
//                 }

//                 final g = items[index - 1];
//                 return GuestTile(
//                   guest: g,
//                   onTap: () {
//                     // Push details WITHOUT another API call
//                     context.router.push(GuestDetailsRoute(guest: g));
//                   },
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// /// The top card: search + segmented tabs row (styled like your design)
// class _HeaderCard extends StatelessWidget {
//   final RsvpStatus? selected;
//   final ValueChanged<RsvpStatus?> onSelect;
//   final ValueChanged<String> onQuery;

//   const _HeaderCard({
//     required this.selected,
//     required this.onSelect,
//     required this.onQuery,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 3,
//       shadowColor: Colors.black12,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
//         child: Column(
//           children: [
//             // search
//             GuestsSearchField(
//               hint: tr('guest_name'),
//               onChanged: onQuery,
//             ),
//             const SizedBox(height: 12),

//             // segmented tabs wrapped in its own "bar" card
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(14),
//                 boxShadow: const [
//                   BoxShadow(
//                     color: Color(0x14000000),
//                     blurRadius: 6,
//                     offset: Offset(0, 2),
//                   )
//                 ],
//                 border: Border.all(color: Colors.black12),
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
//               child: _TabsRow(selected: selected, onSelect: onSelect),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _TabsRow extends StatelessWidget {
//   final RsvpStatus? selected;
//   final ValueChanged<RsvpStatus?> onSelect;
//   const _TabsRow({required this.selected, required this.onSelect});

//   @override
//   Widget build(BuildContext context) {
//     // order must match your design
//     final items = <({String label, RsvpStatus? value})>[
//       (label: 'الكل', value: null),
//       (label: 'التأكيد', value: RsvpStatus.confirmed),
//       (label: 'الاعتذار', value: RsvpStatus.declined),
//       (label: 'الانتظار', value: RsvpStatus.waiting),
//     ];

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: items.map((it) {
//         final bool isSelected = selected == it.value;
//         return _SegmentChip(
//           text: it.label,
//           selected: isSelected,
//           onTap: () => onSelect(it.value),
//         );
//       }).toList(),
//     );
//   }
// }

// class _SegmentChip extends StatelessWidget {
//   final String text;
//   final bool selected;
//   final VoidCallback onTap;
//   const _SegmentChip({
//     required this.text,
//     required this.selected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final selectedColor = const Color(0xFF6A3B00); // the brown in your mock
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(999),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//         decoration: BoxDecoration(
//           color: selected ? selectedColor : Colors.white,
//           borderRadius: BorderRadius.circular(999),
//           border: Border.all(color: selected ? selectedColor : Colors.black26),
//           boxShadow: selected
//               ? const [
//                   BoxShadow(
//                     color: Color(0x1A6A3B00),
//                     blurRadius: 6,
//                     offset: Offset(0, 2),
//                   )
//                 ]
//               : null,
//         ),
//         child: Text(
//           text,
//           style: TextStyle(
//             color: selected ? Colors.white : Colors.black87,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//     );
//   }
// }
