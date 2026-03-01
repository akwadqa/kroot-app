import 'package:dio/dio.dart';
import 'package:wedding_app/features/auth/data/models/create_account/create_account_response.dart';
import 'package:wedding_app/features/auth/data/models/login_params.dart';
import 'package:wedding_app/features/auth/data/models/login_response_model.dart';
import 'package:wedding_app/features/auth/data/models/send_otp/send_otp_response.dart';
import 'package:wedding_app/features/auth/data/models/verify_otp/verify_otp_response.dart';
import 'package:wedding_app/src/constants/Api/api_response.dart';
import 'package:wedding_app/src/constants/Api/end_points.dart';
import 'package:wedding_app/src/network/exception/dio_exceptions.dart';
import 'package:wedding_app/src/network/services/network_service.dart';

class AuthRemoteDataSource {
  final NetworkService _networkService;

  AuthRemoteDataSource(this._networkService);

  Future<ApiResponse<SendOtpResponse>> sendOtp({required String number}) async {
    try {
      final data = FormData.fromMap({'mobile_no': number});
      final response = await _networkService.post(
        EndPoints.sendOtp,
        data: data,
      );
      return ApiResponse.fromJson(
        response.data,
        (json) => SendOtpResponse.fromJson(json as Map<String, dynamic>),
      );
    } on DioException catch (e) {
      if (e.response?.data['status_code'] == 404) {
        return ApiResponse.success(
          data: SendOtpResponse.fromJson(e.response?.data['data']),
        );
      } else
        rethrow;
    } catch (e) {
      return ApiResponse.error(error: e);
    }
  }

  Future<ApiResponse<CreateAccountResponse>> creataAccount({
    required String firstName,
    required String lastName,
    required String mobile,
    String? email,
  }) async {
    try {
      final data = FormData.fromMap({
        'first_name': firstName,
        'last_name': lastName,
        'mobile_no': mobile,
        'email': email,
      });
      final response = await _networkService.post(
        EndPoints.createAccount,
        data: data,
      );
      return ApiResponse.fromJson(
        response.data,
        (json) =>
            CreateAccountResponse.fromJson(json as Map<String, dynamic>? ?? {}),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<VerifyOtpResponse>> verifyOtp({
    required String number,
    required String otp,
  }) async {
    try {
      final data = FormData.fromMap({'mobile_no': number, 'otp': otp});
      final response = await _networkService.post(
        EndPoints.verifyOtp,
        data: data,
      );
      return ApiResponse.fromJson(
        response.data,
        (json) =>
            VerifyOtpResponse.fromJson(json as Map<String, dynamic>? ?? {}),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<LoginResponseModel>> login(LoginParams params) async {
    try {
      final response = await _networkService.post('', data: params.toJson());
      // if (response.data == null || response.status != 200||response.data.isEmpty) {

      //   throw AppException('Failed to Login');
      // }

      return ApiResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) => LoginResponseModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }
}
