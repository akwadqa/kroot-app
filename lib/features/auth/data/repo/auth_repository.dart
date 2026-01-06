import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kroot_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:kroot_app/features/auth/data/models/create_account/create_account_response.dart';
import 'package:kroot_app/features/auth/data/models/login_params.dart';
import 'package:kroot_app/features/auth/data/models/login_response_model.dart';
import 'package:kroot_app/features/auth/data/models/send_otp/send_otp_response.dart';
import 'package:kroot_app/features/auth/data/models/verify_otp/verify_otp_response.dart';
import 'package:kroot_app/src/constants/Api/api_response.dart';
import 'package:kroot_app/src/network/exception/dio_exceptions.dart';
import 'package:kroot_app/src/network/services/dio_client.dart';

part 'auth_repository.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return AuthRepository(AuthRemoteDataSource(networkService));
}

class AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepository(this._remoteDataSource);

  Future<ApiResponse<SendOtpResponse>> sendOtp({required String number}) async {
    try {
      final result = await _remoteDataSource.sendOtp(number: number);
      return result;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<CreateAccountResponse>> createAccount({
    required String firstName,
    required String lastName,
    required String mobile,
    String? email,
  }) async {
    try {
      final result = await _remoteDataSource.creataAccount(
        firstName: firstName,
        lastName: lastName,
        mobile: mobile,
        email: email,
      );
      return result;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<VerifyOtpResponse>> verifyOtp({
    required String number,
    required String otp,
  }) async {
    try {
      final result = await _remoteDataSource.verifyOtp(
        number: number,
        otp: otp,
      );
      return result;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<LoginResponseModel>> login(LoginParams params) async {
    final response = await _remoteDataSource.login(params);
    if (response.hasSucceeded) {
      return response;
    } else {
      throw AppException(response.message);
    }
  }
}
