// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:kroot_app/features/auth/data/models/create_account/create_account_response.dart';
import 'package:kroot_app/features/auth/data/models/verify_otp/verify_otp_response.dart';

class AuthControllerState {
  final VerifyOtpResponse? verifyOtpResponse;
  final CreateAccountResponse? createAccountResponse;

  AuthControllerState({  this.verifyOtpResponse,this.createAccountResponse});

  AuthControllerState copyWith({
    VerifyOtpResponse? verifyOtpResponse,
    CreateAccountResponse? createAccountResponse,
  }) {
    return AuthControllerState(
      createAccountResponse: createAccountResponse ?? this.createAccountResponse,
      verifyOtpResponse: verifyOtpResponse ?? this.verifyOtpResponse,
    );
  }
}
