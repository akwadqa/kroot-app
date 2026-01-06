import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kroot_app/features/scan_qr_code/data/datasources/scan_drive_qr_datasource.dart';
import 'package:kroot_app/features/scan_qr_code/domain/model/checkin_models.dart';
import 'package:kroot_app/features/scan_qr_code/domain/model/gates_info_model.dart';
import 'package:kroot_app/src/constants/Api/api_response.dart';
import 'package:kroot_app/src/network/services/dio_client.dart';

part 'scan_driver_qr_repository.g.dart';

@Riverpod(keepAlive: true)
ScanDriverQrRepository scanDriverQrRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return ScanDriverQrRepository(ScanDriveQrDatasource(networkService));
}

class ScanDriverQrRepository {
  final ScanDriveQrDatasource _remoteDataSource;

  ScanDriverQrRepository(this._remoteDataSource);

  Future<ApiResponse<List<GatesInfoModel>>> getAllAvailableGates() async {
    try {
      final result = await _remoteDataSource.getAllAvailableGates();

      if (result.status == 200) {
        return result;
      } else {
        throw Exception(
          'Failed to Fetch getAllAvailableGates: ${result.message}',
        );
      }
    } catch (e) {
      throw Exception('Failed to Fetch getAllAvailableGates: $e');
    }
  }

  Future<ApiResponse<CheckinPayload>> fetchByQrCode({
    String? gateName,
    String? qrResult,
    String? inviteeId,
  }) async {
    final response = await _remoteDataSource.fetchByQrCode(
      gateName: gateName,
      inviteeId: inviteeId,
      qrResult: qrResult,
    );

    return response;
  }
}
