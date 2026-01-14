// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SendOtpResponse _$SendOtpResponseFromJson(Map<String, dynamic> json) =>
    _SendOtpResponse(
      mobile_number: json['mobile_number'] as String?,
      remaining_attempts: (json['remaining_attempts'] as num?)?.toInt(),
      allow_login_after: (json['allow_login_after'] as num?)?.toInt(),
      validation: json['validation'] == null
          ? null
          : ValidationModel.fromJson(
              json['validation'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$SendOtpResponseToJson(_SendOtpResponse instance) =>
    <String, dynamic>{
      'mobile_number': instance.mobile_number,
      'remaining_attempts': instance.remaining_attempts,
      'allow_login_after': instance.allow_login_after,
      'validation': instance.validation,
    };

_ValidationModel _$ValidationModelFromJson(Map<String, dynamic> json) =>
    _ValidationModel(
      mobile_number: json['mobile_number'] as String?,
      user_exist: json['user_exist'] as bool?,
      user_enabled: json['user_enabled'] as bool?,
      OTP_valid: json['OTP_valid'] as bool?,
    );

Map<String, dynamic> _$ValidationModelToJson(_ValidationModel instance) =>
    <String, dynamic>{
      'mobile_number': instance.mobile_number,
      'user_exist': instance.user_exist,
      'user_enabled': instance.user_enabled,
      'OTP_valid': instance.OTP_valid,
    };
