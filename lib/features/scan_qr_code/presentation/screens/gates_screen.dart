// gates_screen.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kroot_app/features/scan_qr_code/domain/model/gates_info_model.dart';
import 'package:kroot_app/features/scan_qr_code/presentation/controller/scan_qr_code_controller.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/shared_widgets/app_dialogs.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/utils/app_alert.dart';

class GatesScreen extends ConsumerWidget {
  const GatesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(scanQrCodeControllerProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 55),
        child: CustomAppbar(title: tr('select_gate')), // ✅ translated
      ),
      body: asyncState.when(
        loading: () =>
            //  Center(child: Assets.images.animationLoading.image()),
             Center(child: MailPulseAnimation()),
        error: (e, _) => Center(
          child: Text(
            tr('something_went_wrong', args: [e.toString()]),
            textAlign: TextAlign.center,
          ),
        ),
        data: (state) {
          final gates = state.gates;
          if (gates.isEmpty) {
            return Center(
              child: Text(
                tr('no_gates_found'), // ✅ translated
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.1,
            ),
            itemCount: gates.length,
            itemBuilder: (_, i) => _GateCard(gate: gates[i]),
          );
        },
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

class _GateCard extends ConsumerWidget {
  final GatesInfoModel gate;
  const _GateCard({required this.gate});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () async {
        final ctrl = ref.read(scanQrCodeControllerProvider.notifier);
        AppDialogs.loading(context);
        try {
          final res = await ctrl.verifyAtGate(
            gate.nameId ?? gate.gateName ?? 'gate',
          );
          AppDialogs.close(context);
          Navigator.of(context).pop();
          Navigator.of(context).pop();

          final ok = res.status == 200 || res.hasSucceeded;
          if (ok) {
            final items = res.data?.items ?? const [];
            final first = items.isNotEmpty ? items.first : null;

            await AppDialogs.success(
              context,
              title: tr('checkin_success_title'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(res.message ?? tr('checkin_success_message')),
                  const SizedBox(height: 12),
                  _kv(tr('gate_label'), gate.gateName ?? '-'),
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
        } catch (e) {
          // AppDialogs.close(context);
          await AppDialogs.error(
            context,
            title: tr('checkin_denied_title'),
            message: e.toString(),
            okText: tr('ok'),
          );
        }
      },
      //  ref
      //     .read(scanQrCodeControllerProvider.notifier)
      //     .verifyAtGate(context, gate.nameId ?? gate.gateName ?? 'gate'),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
          border: Border.all(color: AppColors.border, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.meeting_room, size: 40, color: AppColors.primary),
            const SizedBox(height: 12),
            Text(
              gate.gateName ?? tr('gate'), // ✅ fallback translation
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
