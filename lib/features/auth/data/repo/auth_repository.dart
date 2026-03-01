// 📄 auth_repository.dart

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wedding_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:wedding_app/features/auth/data/models/create_account/create_account_response.dart';
import 'package:wedding_app/features/auth/data/models/login_params.dart';
import 'package:wedding_app/features/auth/data/models/login_response_model.dart';
import 'package:wedding_app/features/auth/data/models/send_otp/send_otp_response.dart';
import 'package:wedding_app/features/auth/data/models/verify_otp/verify_otp_response.dart';
import 'package:wedding_app/src/constants/Api/api_response.dart';
import 'package:wedding_app/src/network/check_net/check_net.dart';
import 'package:wedding_app/src/network/exception/dio_exceptions.dart';
import 'package:wedding_app/src/network/services/dio_client.dart';

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
    return CheckNet<ApiResponse<SendOtpResponse>>().checkNetResponse(
      tryRight: () async {
        final result = await _remoteDataSource.sendOtp(number: number);
        if (result.status != 200 && result.status != 404) {
          throw Exception(result.message);
        }
        return result;
      },
    );
  }

  Future<ApiResponse<CreateAccountResponse>> createAccount({
    required String firstName,
    required String lastName,
    required String mobile,
    String? email,
  }) async {
    return CheckNet<ApiResponse<CreateAccountResponse>>().checkNetResponse(
      tryRight: () async {
        final result = await _remoteDataSource.creataAccount(
          firstName: firstName,
          lastName: lastName,
          mobile: mobile,
          email: email,
        );
        return result;
      },
    );
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
      if (result.status != 200 || result.hasFailed) {
        throw Exception(result.message);
      }
      return result;
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    } catch (e) {
      throw Exception(e);
    }
    // return CheckNet<ApiResponse<VerifyOtpResponse>>().checkNetResponse(
    //   tryRight: () async {
    //     final result = await _remoteDataSource.verifyOtp(
    //       number: number,
    //       otp: otp,
    //     );
    //     if (result.status != 200 || result.hasFailed) {
    //       throw Exception(result.message);
    //     }
    //     return result;
    //   },
    // );
  }

  // Future<String> _handleAuthResponse(Map<String, dynamic> responseData) async {
  //   final int? statusCode = responseData['status_code'];
  //   final String? message = responseData['message'];

  //   if (statusCode == 200) {
  //     return message ?? '';
  //   } else {
  //     throw Exception(message ?? "An unknown error occurred");
  //   }
  // }

  Future<ApiResponse<LoginResponseModel>> login(LoginParams params) async {
    final response = await _remoteDataSource.login(params);
    if (response.hasSucceeded) {
      return response;
    } else {
      throw AppException(response.message);
    }
    // return await _handleAuthResponse(response);
  }
}
