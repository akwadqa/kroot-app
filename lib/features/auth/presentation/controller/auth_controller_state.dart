import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kroot_app/features/auth/data/models/create_account/create_account_response.dart';
import 'package:kroot_app/features/auth/data/models/send_otp/send_otp_response.dart';
import 'package:kroot_app/features/auth/data/models/verify_otp/verify_otp_response.dart';

class AuthControllerState {
  final AsyncValue<VerifyOtpResponse?>? verifyOtpResponse;
  final AsyncValue<CreateAccountResponse?>? createAccountResponse;
  final AsyncValue<SendOtpResponse?>? resendOtpResponse;

  AuthControllerState({required this.verifyOtpResponse,required this.createAccountResponse, required this.resendOtpResponse});
  factory AuthControllerState.initial() {
    return AuthControllerState(
      verifyOtpResponse: null,
      createAccountResponse: null,
      resendOtpResponse: null,
    );
  }

  AuthControllerState copyWith({
   AsyncValue<VerifyOtpResponse?>? verifyOtpResponse,
    AsyncValue<CreateAccountResponse?>? createAccountResponse,
    AsyncValue<SendOtpResponse?>? resendOtpResponse,
  }) {
    return AuthControllerState(
      createAccountResponse:
          createAccountResponse ?? this.createAccountResponse,
      verifyOtpResponse: verifyOtpResponse ?? this.verifyOtpResponse,
      resendOtpResponse: resendOtpResponse ?? this.resendOtpResponse,
    );
  }
}
