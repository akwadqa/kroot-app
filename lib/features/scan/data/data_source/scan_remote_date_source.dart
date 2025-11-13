import 'package:dio/dio.dart';
import 'package:wedding_app/features/scan/data/model/scan_qr_response/scan_qr_response.dart';
import 'package:wedding_app/src/constants/Api/api_response.dart';
import 'package:wedding_app/src/constants/Api/end_points.dart';
import 'package:wedding_app/src/network/services/network_service.dart';

class ScanRemoteDateSource {
  final NetworkService _networkService;

  ScanRemoteDateSource(this._networkService);

  Future<ApiResponse<ScanQrResponse>> scanQr({
    required String qrCode,
    required String checkinBy,
    required String inviteeId,
  }) async {
    try {
      final data = FormData.fromMap({
        'qr_code': qrCode,
        'checkin_by': checkinBy,
        'invitee_id': inviteeId,
      });
      final response = await _networkService.post(EndPoints.scanQr, data: data);
      return ApiResponse.fromJson(
        response.data,
        (json) => ScanQrResponse.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  // Future<ApiResponse<ScanQrResponse>> scanQr({
  //   required String qrCode,
  //   required String checkinBy,
  //   required String inviteeId,
  // }) async {
  //   try {
  //     final data = FormData.fromMap({
  //       'qr_code': qrCode,
  //       'checkin_by': checkinBy,
  //       'invitee_id': inviteeId,
  //     });
  //     final response = await _networkService.post(
  //       EndPoints.getScaned,
  //       data: data,
  //     );
  //     return ApiResponse.fromJson(
  //       response.data,
  //       (json) => ScanQrResponse.fromJson(json as Map<String, dynamic>),
  //     );
  //   } catch (e) {
  //     return ApiResponse.error(message: e.toString());
  //   }
  // }
}
