import 'package:dio/dio.dart';
import 'package:kroot_app/src/constants/Api/api_response.dart';
import 'package:kroot_app/src/constants/Api/end_points.dart';
import 'package:kroot_app/src/network/services/network_service.dart';

class ProfileRemoteDataSource {
  final NetworkService _networkService;

  ProfileRemoteDataSource(this._networkService);

  Future<ApiResponse<String>> getPaymentLink(String type, String local) async {
    try {
      final data = FormData.fromMap({'bundle': type, 'language': local});

      final response = await _networkService.get(
        EndPoints.getPaymentLink,
        data: data,
      );

      return ApiResponse.fromJson(
        response.data,
        (json) => (json as Map)['payment_url'],
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<void>> deleteUser(String id) async {
    try {
      final data = FormData.fromMap({'user_id': id});
      final response = await _networkService.post(
        EndPoints.deleteUser,
        data: data,
        // queryParameters: {},
      );

      if (response.data == null || response.statusCode != 200) {
        throw Exception('Request failed');
      }

      return ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) {},
      );
    } catch (e) {
      // Dev.logLine('Error in submitData: e');
      rethrow;
    }
  }

  Future<ApiResponse<void>> logout() async {
    try {
      final response = await _networkService.post(
        EndPoints.logout,
        // queryParameters: {},
      );

      if (response.data == null || response.statusCode != 200) {
        throw Exception('Request failed');
      }

      return ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) {},
      );
    } catch (e) {
      // Dev.logLine('Error in submitData: e');
      rethrow;
    }
  }
}
