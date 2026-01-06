part of 'login_response_model.dart';

_LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    _LoginResponseModel(
      token: json['token'] as String,
      fullName: json['full_name'] as String?,
      email: json['user'] as String,
    );

Map<String, dynamic> _$LoginResponseModelToJson(_LoginResponseModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'full_name': instance.fullName,
      'user': instance.email,
    };
