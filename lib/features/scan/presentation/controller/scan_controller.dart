import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kroot_app/features/scan/data/model/scan_qr_response/scan_qr_response.dart';
import 'package:kroot_app/features/scan/data/repository/scan_respository.dart';
import 'package:kroot_app/features/scan/presentation/controller/scan_state.dart';
import 'package:kroot_app/features/scan_qr_code/data/repositories/scan_driver_qr_repository.dart';

part 'scan_controller.g.dart';

@riverpod
class ScanController extends _$ScanController {
  @override
  FutureOr<ScanState> build() {
    return ScanState.init();
  }

  Future<ScanQrResponse?> scanQr({
    required String qrCode,
    required String checkinBy,
    required String inviteeId,
  }) async {
    try {
      state = AsyncLoading();
      final repo = ref.read(scanRepositoryProvider);
      final response = await repo.scanQr(
        qrCode: qrCode,
        checkinBy: checkinBy,
        inviteeId: inviteeId,
      );

      if (response.hasFailed) {
        state = AsyncError(
          response.message ?? '',
          StackTrace.fromString(response.message ?? ''),
        );
        // throw Exception(response.message);
      }

      state = AsyncData(state.value!.copyWith(scanQrResponse: response.data));
      return response.data;
    } catch (e, st) {
      state = AsyncError(e, st);
      return null;
    }
  }
}
