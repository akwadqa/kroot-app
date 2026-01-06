// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VerifyOtpResponse _$VerifyOtpResponseFromJson(Map<String, dynamic> json) =>
    _VerifyOtpResponse(
      userId: json['userId'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      mobileNo: json['mobileNo'] as String?,
      token: json['token'] as String?,
      validation: json['validation'] == null
          ? null
          : ValidationData.fromJson(json['validation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerifyOtpResponseToJson(_VerifyOtpResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'mobileNo': instance.mobileNo,
      'token': instance.token,
      'validation': instance.validation,
    };

_ValidationData _$ValidationDataFromJson(Map<String, dynamic> json) =>
    _ValidationData(
      mobileNumber: json['mobile_number'] as String?,
      userExist: json['user_exist'] as bool?,
      userEnabled: json['user_enabled'] as bool?,
      otpValid: json['OTP_valid'] as bool?,
    );

Map<String, dynamic> _$ValidationDataToJson(_ValidationData instance) =>
    <String, dynamic>{
      'mobile_number': instance.mobileNumber,
      'user_exist': instance.userExist,
      'user_enabled': instance.userEnabled,
      'OTP_valid': instance.otpValid,
    };
