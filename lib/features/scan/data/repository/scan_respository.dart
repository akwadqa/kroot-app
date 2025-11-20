import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wedding_app/features/scan/data/data_source/scan_remote_date_source.dart';
import 'package:wedding_app/features/scan/data/model/scan_qr_response/scan_qr_response.dart';
import 'package:wedding_app/features/scan/data/model/user_scan_event_response/user_scan_event_response.dart';
import 'package:wedding_app/src/constants/Api/api_response.dart';
import 'package:wedding_app/src/network/check_net/check_net.dart';
import 'package:wedding_app/src/network/services/dio_client.dart';

part 'scan_respository.g.dart';

@Riverpod(keepAlive: true)
ScanRespository scanRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return ScanRespository(ScanRemoteDateSource(networkService));
}

class ScanRespository {
  final ScanRemoteDateSource remoteDateSource;

  ScanRespository(this.remoteDateSource);

  Future<ApiResponse<ScanQrResponse>> scanQr({
    required String qrCode,
    required String checkinBy,
    required String inviteeId,
  }) async {
    return CheckNet<ApiResponse<ScanQrResponse>>().checkNetResponse(
      tryRight: () async {
        final respone = await remoteDateSource.scanQr(
          qrCode: qrCode,
          checkinBy: checkinBy,
          inviteeId: inviteeId,
        );
        return respone;
      },
    );
  }

  Future<ApiResponse<UserScanEventResponse>> getUserScanEvent({
    required int page,
  }) async {
    return CheckNet<ApiResponse<UserScanEventResponse>>().checkNetResponse(
      tryRight: () async {
        final respone = await remoteDateSource.getUserScanEvent(page: page);
        return respone;
      },
    );
  }
}
