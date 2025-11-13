// features/guests/presentation/widgets/guest_tile.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kroot_app/features/guests/domain/model/guest_model.dart';
import 'package:kroot_app/src/theme/app_colors.dart';


class GuestTile extends StatelessWidget {
  final GuestModel guest;
  final VoidCallback onTap;
  const GuestTile({super.key, required this.guest, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final (label, color) = _badge(guest.rsvpStatus);
    return ListTile(
      onTap: onTap,
      title: Text(guest.fullName,style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),),
      trailing: _StatusBadge(text: label, color: color),
      // subtitle: guest.whatsappNumber == null
      //     ? null
      //     : Text(guest.whatsappNumber!, textAlign: TextAlign.right),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }

  (String, Color) _badge(RsvpStatus s) {
    switch (s) {
       case RsvpStatus.confirmed:
      return (tr('confirmed'), AppColors.deepGreen);
    case RsvpStatus.declined:
      return (tr('declined'),AppColors.redy);
      case RsvpStatus.notSent:
        return (tr('not_sent'), AppColors.primary);
      case RsvpStatus.failed:
        return (tr('failed'), AppColors.newRed);
    case RsvpStatus.pending:
      return (tr('pending'), Colors.grey);
    case RsvpStatus.all:
      throw UnimplementedError();
    }
  }
}

class _StatusBadge extends StatelessWidget {
  final String text;
  final Color color;
  const _StatusBadge({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child:
          Text(text, style: TextStyle(color: color, fontWeight: FontWeight.w600)),
    );
  }
}
