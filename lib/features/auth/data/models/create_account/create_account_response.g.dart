// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateAccountResponse _$CreateAccountResponseFromJson(
  Map<String, dynamic> json,
) => _CreateAccountResponse(
  user_id: json['user_id'] as String?,
  first_name: json['first_name'] as String?,
  last_name: json['last_name'] as String?,
  email: json['email'] as String?,
  mobile_no: json['mobile_no'] as String?,
);

Map<String, dynamic> _$CreateAccountResponseToJson(
  _CreateAccountResponse instance,
) => <String, dynamic>{
  'user_id': instance.user_id,
  'first_name': instance.first_name,
  'last_name': instance.last_name,
  'email': instance.email,
  'mobile_no': instance.mobile_no,
};
