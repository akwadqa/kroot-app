// // features/guests/presentation/widgets/status_filter_bar.dart
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:wedding_app/features/guests/domain/model/guest_model.dart';

// class StatusFilterBar extends StatefulWidget {
//   final ValueChanged<RsvpStatus?> onChanged;
//   const StatusFilterBar({super.key, required this.onChanged});

//   @override
//   State<StatusFilterBar> createState() => _StatusFilterBarState();
// }

// class _StatusFilterBarState extends State<StatusFilterBar> {
//   RsvpStatus? current;

//   @override
//   Widget build(BuildContext context) {
//     final items = <(String, RsvpStatus?)>[
//       ('status_all', null),
//       ('confirmed', RsvpStatus.confirmed),
//       ('not_sent', RsvpStatus.notSent),
//       ('failed', RsvpStatus.failed),
//       ('declined', RsvpStatus.declined),
//       ('pending', RsvpStatus.pending),
//     ];

//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Center(
//         child: Card(
//           elevation: 2,

//           child: Row(
//             children: items.map((e) {
//               final selected = current == e.$2;
//               return Padding(
//                 padding: const EdgeInsets.only(right: 8),
//                 child: ChoiceChip(
//                   label: Text(tr(e.$1)),
//                   selected: selected,
//                   onSelected: (_) {
//                     setState(() => current = e.$2);
//                     widget.onChanged(e.$2);
//                   },
//                   selectedColor: const Color(0xFF6A3B00),
//                   backgroundColor: Colors.grey.shade200,
//                   labelStyle:
//                       TextStyle(color: selected ? Colors.white : Colors.black87),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//       ),
//     );
//   }
// }
