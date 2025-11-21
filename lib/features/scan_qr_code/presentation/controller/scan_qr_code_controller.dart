import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kroot_app/features/scan_qr_code/data/repositories/scan_driver_qr_repository.dart';
import 'package:kroot_app/features/scan_qr_code/domain/model/gates_info_model.dart';
import 'package:kroot_app/features/scan_qr_code/domain/model/checkin_models.dart';
import 'package:kroot_app/src/constants/Api/api_response.dart';
import 'package:kroot_app/src/network/exception/dio_exceptions.dart';

part 'scan_qr_code_controller.g.dart';

@Riverpod(keepAlive: true)
class ScanQrCodeController extends _$ScanQrCodeController {
  @override
  FutureOr<ScanDriverQrState> build() => const ScanDriverQrState();

  Future<bool> setScannedCode(String qr) async {
    state = AsyncData(state.value!.copyWith(scannedCode: qr));
    // await loadGates();
    return true;
  }

  Future<void> loadGates() async {
    state = const AsyncLoading();
    final repo = ref.read(scanDriverQrRepositoryProvider);
    final res = await repo.getAllAvailableGates();
    state = AsyncData(state.value!.copyWith(gates: res.data ?? const []));
  }

  /// UI will decide how to present success/denied.
  Future<ApiResponse<CheckinPayload>> verifyAtGate(String gateName) async {
    final qr = state.value?.scannedCode ?? '';
    final repo = ref.read(scanDriverQrRepositoryProvider);
    resetState();
    return repo.fetchByQrCode(gateName: gateName, qrResult: qr);
  }

  void resetState() {
    state = AsyncData(state.value!.copyWith(scannedCode: null));
  }

  Future<ApiResponse<CheckinPayload>> verifyAtGuest(String inviteeId) async {
    // final qr = state.value?.scannedCode ?? '';
    final repo = ref.read(scanDriverQrRepositoryProvider);
    return repo.fetchByQrCode(inviteeId: inviteeId);
  }

  Future<ApiResponse<CheckinPayload>> checkInGuest(String inviteeId) async {
    // state = const AsyncLoading();

    try {
      final response = await verifyAtGuest(inviteeId);

      if (response.hasSucceeded) {
        // update guest status in memory to confirmed
        // final updated = _guests.map((g) {
        //   if (g.name == inviteeId) {
        //     return g.copyWith(rsvpStatus: RsvpStatus.confirmed);
        //   }
        //   return g;
        // }).toList();

        // _guests = updated;
        return response;
        // state = AsyncData(updated);
      } else {
        state = AsyncError(
          response.message ?? "Check-in failed",
          StackTrace.current,
        );
        return response;
      }
      
    } catch (e, st) {
      state = AsyncError(e, st);
      throw AppException();
    }
  }
}

class ScanDriverQrState {
  final String? scannedCode;
  final List<GatesInfoModel> gates;
  const ScanDriverQrState({this.scannedCode, this.gates = const []});

  ScanDriverQrState copyWith({
    String? scannedCode,
    List<GatesInfoModel>? gates,
  }) {
    return ScanDriverQrState(
      scannedCode: scannedCode ?? this.scannedCode,
      gates: gates ?? this.gates,
    );
  }
}

// class ScanDriverQrState {
//   final bool scanned;
//   final String? scannedCode;
//   final List<GatesInfoModel> gates;

//   const ScanDriverQrState({
//     this.scanned = false,
//     this.scannedCode,
//     this.gates = const [],
//   });

//   ScanDriverQrState copyWith({
//     bool? scanned,
//     String? scannedCode,
//     List<GatesInfoModel>? gates,
//   }) {
//     return ScanDriverQrState(
//       scanned: scanned ?? this.scanned,
//       scannedCode: scannedCode ?? this.scannedCode,
//       gates: gates ?? this.gates,
//     );
//   }
// }
