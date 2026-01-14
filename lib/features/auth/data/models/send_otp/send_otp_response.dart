import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_otp_response.freezed.dart';
part 'send_otp_response.g.dart';


@freezed
abstract class SendOtpResponse with _$SendOtpResponse {
  const factory SendOtpResponse({
    String? mobile_number,
    int? remaining_attempts,
    int? allow_login_after,
    ValidationModel? validation,
  }) = _SendOtpResponse;

  factory SendOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$SendOtpResponseFromJson(json);
}

@freezed
abstract class ValidationModel with _$ValidationModel {
  const factory ValidationModel({
    String? mobile_number,
    bool? user_exist,
    bool? user_enabled,
    bool? OTP_valid,
  }) = _ValidationModel;

  factory ValidationModel.fromJson(Map<String, dynamic> json) =>
      _$ValidationModelFromJson(json);
}
