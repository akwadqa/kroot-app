
import 'package:kroot_app/features/scan_qr_code/domain/model/checkin_models.dart';
import 'package:kroot_app/features/scan_qr_code/domain/model/gates_info_model.dart';
import 'package:kroot_app/src/constants/Api/api_response.dart';
import 'package:kroot_app/src/constants/Api/end_points.dart';
import 'package:kroot_app/src/network/services/network_service.dart';

class ScanDriveQrDatasource {
  final NetworkService _networkService;

  ScanDriveQrDatasource(this._networkService);

  Future<ApiResponse<List<GatesInfoModel>>> getAllAvailableGates(
  ) async {
    try {
      final response = await _networkService.get(
        EndPoints.getActiveGates,
        // queryParameters: {'driver_id': driverId, 'action': "driver"},
      );
    return ApiResponse.fromJson(
        response.data,
        (json) => (json as List)
            .map((item) =>
                GatesInfoModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }
    Future<ApiResponse<CheckinPayload>> fetchByQrCode({String? gateName,String? qrResult,String? inviteeId}) async {
    final  response = await _networkService.post(
      EndPoints.qrCheck,
      queryParameters: {
        "qr_code":qrResult,
        "gate":gateName,
        "invitee_id":inviteeId,
        "checkin_by":"Administrator",
      },
    );
      // if (response.data == null || response.status != 200) {

      //   throw Exception('Failed to load profile data');
      // }

  return ApiResponse.fromJson(
    Map<String, dynamic>.from(response.data as Map),
      (json) => CheckinPayload.fromAny(json),
  );
      

}
}
