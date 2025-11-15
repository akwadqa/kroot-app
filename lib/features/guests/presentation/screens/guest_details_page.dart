// features/guests/presentation/pages/guest_details_page.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wedding_app/features/guests/domain/model/guest_model.dart';
import 'package:wedding_app/features/guests/presentation/controller/guest_details_controller.dart';
import 'package:wedding_app/features/guests/presentation/controller/guests_controller.dart';
import 'package:wedding_app/features/scan_qr_code/presentation/controller/scan_qr_code_controller.dart';
import 'package:wedding_app/src/extenssions/widget_extensions.dart';
import 'package:wedding_app/src/shared_widgets/app_dialogs.dart';
import 'package:wedding_app/src/shared_widgets/app_error_widget.dart';
import 'package:wedding_app/src/shared_widgets/custom_appbar.dart';
import 'package:wedding_app/src/shared_widgets/custom_button_widget.dart';
import 'package:wedding_app/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class GuestDetailsPage extends ConsumerWidget {
  final GuestModel guest;
  const GuestDetailsPage({super.key, required this.guest});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (statusLabel, statusColor) = _badge(guest.rsvpStatus);
    final ctrl = ref.watch(scanQrCodeControllerProvider);
    final asyncInviteeDetails = ref.watch(
      guestDetailsControllerProvider(guest.name),
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 65),
        child: CustomAppbar(title: tr("guest_details")),
      ),
      //  AppBar(title: Text(guest.fullName, overflow: TextOverflow.ellipsis)),
      body: ctrl.isLoading
          ? FadeCircleLoadingIndicator().centered()
          : asyncInviteeDetails.when(
              data: (guest) {
                return ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    // Header card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          _AvatarCircle(name: guest.fullName),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  guest.fullName,
                                  // textAlign: TextAlign.right,
                                  style: Theme.of(context).textTheme.titleLarge,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 6),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: _StatusBadge(
                                    text: statusLabel,
                                    color: statusColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Quick actions (only shown if phone exists)
                    if (guest.whatsappNumber != null &&
                        guest.whatsappNumber!.isNotEmpty)
                      _ActionsRow(phone: guest.whatsappNumber!),

                    const SizedBox(height: 16),

                    // Info sections
                    _InfoTile(
                      label: tr('occasion'),
                      value: guest.occasionName ?? guest.occasion ?? '-',
                      icon: Icons.event,
                    ),
                    _InfoTile(
                      label: tr('party_size'),
                      value: guest.partySize.toString(),
                      icon: Icons.group,
                    ),
                    _InfoTile(
                      label: tr('phone'),
                      value: guest.whatsappNumber ?? '-',
                      icon: Icons.call,
                    ),
                    _InfoTile(
                      label: tr('guest_id'),
                      value: guest.name ?? "",
                      icon: Icons.badge,
                    ),
                    _InfoTile(
                      label: tr('checkin_count'),
                      value: guest.checkinCount.toString() ?? "",
                      icon: Icons.badge,
                    ),
                    const SizedBox(height: 16),
                    if (guest.rsvpStatus != RsvpStatus.declined)
                      _CheckInRow(guest: guest),

                    // Add more fields if you add them to GuestModel (e.g., table, notes, etc.)
                  ],
                );
              },
              error: (e, _) => AppErrorWidget(),
              loading: () => FadeCircleLoadingIndicator().centered(),
            ),
    );
  }

  (String, Color) _badge(RsvpStatus s) {
    switch (s) {
      case RsvpStatus.confirmed:
        return (tr('confirmed'), AppColors.deepGreen);
      case RsvpStatus.declined:
        return (tr('declined'), AppColors.redy);
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

class _AvatarCircle extends StatelessWidget {
  final String name;
  const _AvatarCircle({required this.name});

  @override
  Widget build(BuildContext context) {
    final initials = _initials(name);
    return CircleAvatar(
      radius: 28,
      backgroundColor: Colors.brown.shade600,
      child: Text(
        initials,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
      ),
    );
  }

  String _initials(String n) {
    final parts = n.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '';
    if (parts.length == 1) return parts.first.characters.take(1).toString();
    return (parts.first.characters.first + parts.last.characters.first);
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
        color: color.withOpacity(.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color),
      ),
      child: Text(
        text,
        style: TextStyle(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _InfoTile({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.brown.shade600),
              const SizedBox(width: 12),

              Text(
                label,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: Colors.grey[600]),
              ),
            ],
          ),

          // const SizedBox(width: 12),
          Text(
            value,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

Widget _kv(String k, String v) => Padding(
  padding: const EdgeInsets.only(top: 6),
  child: Row(
    children: [
      Expanded(
        flex: 5,
        child: Text(k, style: const TextStyle(fontWeight: FontWeight.w600)),
      ),
      const SizedBox(width: 8),
      Expanded(flex: 7, child: Text(v, textAlign: TextAlign.end)),
    ],
  ),
);

class _CheckInRow extends ConsumerWidget {
  final GuestModel guest;
  const _CheckInRow({required this.guest});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctrl = ref.read(scanQrCodeControllerProvider.notifier);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tr('confirm_attendance'),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            CustomButtonWidget(
              text: context.tr("ok"),
              onTap: () async {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) =>
                      const Center(child: FadeCircleLoadingIndicator()),
                );
                final res = await ctrl.checkInGuest(guest.name);
                AppDialogs.close(context);
                // Navigator.of(context).pop();
                // Navigator.of(context).pop();

                final ok = res.status == 200 || res.hasSucceeded;
                if (ok) {
                  final items = res.data?.items ?? const [];
                  final first = items.isNotEmpty ? items.first : null;
                  ref
                      .read(guestDetailsControllerProvider(guest.name).notifier)
                      .fetchGuestDetailsData(guest.name);
                  await AppDialogs.success(
                    context,
                    title: tr('checkin_success_title'),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(res.message ?? tr('checkin_success_message')),
                        const SizedBox(height: 12),
                        // _kv(tr('gate_label'), gate.gateName ?? '-'),
                        if (first?.invitee != null)
                          _kv(tr('invitee_label'), first!.invitee!),
                        if (first?.occasion != null)
                          _kv(tr('occasion_label'), first!.occasion!),
                        if (first?.partySize != null)
                          _kv(tr('party_size_label'), '${first!.partySize}'),
                      ],
                    ),
                    okText: tr('ok'),
                  );
                } else {
                  await AppDialogs.error(
                    context,
                    title: tr('checkin_denied_title'),
                    message: res.message ?? tr('checkin_denied_message'),
                    okText: tr('ok'),
                  );
                }
                // final input =
                //    driverIdController.text.trim();
                // if (input.isNotEmpty) {
                //   // await  ref.read(scanQrCodeControllerProvider.notifier).searchByDriverID(context);
                //   _submitQrCode(input);
                // }
              },
              backgroundColor: AppColors.primary,
              isFiled: true,
              height: 25,
              radius: 12,
              width: 50,
            ).onlyPadding(bottom: 20),
          ],
        ),
      ),
    );
  }
}

class _ActionChip extends StatelessWidget {
  final String label;
  final Widget icon;
  final VoidCallback onTap;
  const _ActionChip({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 6),
            Text(label, style: TextStyle(color: Colors.brown.shade700)),
          ],
        ),
      ),
    );
  }
}

class _ActionsRow extends StatelessWidget {
  final String phone;
  const _ActionsRow({required this.phone});

  Future<void> _launchUrl(Uri uri) async {
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _ActionChip(
          label: tr('call'),
          icon: Icon(Icons.phone, size: 18, color: Colors.brown.shade700),
          onTap: () {
            _launchUrl(Uri.parse('tel:$phone'));
          },
        ),
        const SizedBox(width: 10),
        _ActionChip(
          label: tr('whatsapp'),
          icon: Icon(Icons.message, size: 18, color: Colors.green),

          onTap: () {
            _launchUrl(
              Uri.parse(
                'https://wa.me/$phone?text=${Uri.encodeComponent(tr('default_whatsapp_message'))}',
              ),
            );
          },
        ),
        const Spacer(),
      ],
    );
  }
}
