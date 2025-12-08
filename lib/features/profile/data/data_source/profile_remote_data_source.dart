import 'package:dio/dio.dart';
import 'package:kroot_app/src/constants/Api/api_response.dart';
import 'package:kroot_app/src/constants/Api/end_points.dart';
import 'package:kroot_app/src/network/services/network_service.dart';

class ProfileRemoteDataSource {
  final NetworkService _networkService;

  ProfileRemoteDataSource(this._networkService);

  Future<ApiResponse<String>> getPaymentLink(String type,String local) async {
    try {
      final data = FormData.fromMap({
        'subscription_type': type,
        'language': local,
      });

      final response = await _networkService.get(
        EndPoints.getPaymentLink,
        data: data,
        // queryParameters: {'subscription_type': "Basic"},
      );

      return ApiResponse.fromJson(
        response.data,
        (json) => (json as Map)['payment_url'],
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }
}
