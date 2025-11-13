import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kroot_app/features/scan/data/data_source/scan_remote_date_source.dart';
import 'package:kroot_app/features/scan/data/model/scan_qr_response/scan_qr_response.dart';
import 'package:kroot_app/src/constants/Api/api_response.dart';
import 'package:kroot_app/src/network/check_net/check_net.dart';
import 'package:kroot_app/src/network/services/dio_client.dart';

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
}
