// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:kroot_app/features/guests/domain/model/guest_model.dart';
// import 'package:kroot_app/src/theme/app_colors.dart';

// class GuestCardWidget extends StatelessWidget {
//   final GuestModel guest;
//   final VoidCallback? onTap;
//   const GuestCardWidget({super.key, required this.guest, this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     final (label, color) = _badge(guest.rsvpStatus);

//     return InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10),
//         child: Row(
//           children: [
//             // Status badge (left)
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//               decoration: BoxDecoration(
//                 color: color.withOpacity(.12),
//                 borderRadius: BorderRadius.circular(999),
//                 border: Border.all(color: color),
//               ),
//               child: Text(label, style: TextStyle(color: color, fontWeight: FontWeight.w600)),
//             ),
//             const Spacer(),
//             // Name (right)
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Text(
//                   guest.fullName,
//                   style: Theme.of(context).textTheme.titleMedium,
//                   textAlign: TextAlign.right,
//                 ),
//                 if (guest.whatsappNumber != null)
//                   Text(
//                     guest.whatsappNumber!,
//                     style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
//                     textAlign: TextAlign.right,
//                   ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   (String, Color) _badge(RsvpStatus s) {
//     switch (s) {
//       case RsvpStatus.confirmed:
//         return ('مؤكد', const Color(0xFF388E3C));
//       case RsvpStatus.declined:
//         return ('اعتذر', const Color(0xFFD32F2F));
//       case RsvpStatus.notSent:
//         return (tr('not_sent'), AppColors.primary);
//       case RsvpStatus.failed:
//         return (tr('failed'), AppColors.newRed);
//       case RsvpStatus.pending:
//         return ('قيد الانتظار', Colors.grey);
//       case RsvpStatus.all:
//         // TODO: Handle this case.
//         throw UnimplementedError();
//     }
//   }
// }
