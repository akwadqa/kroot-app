// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_guest_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateGuestResponse _$UpdateGuestResponseFromJson(Map<String, dynamic> json) =>
    _UpdateGuestResponse(
      inviteeId: json['invitee_id'] as String,
      fullName: json['full_name'] as String?,
    );

Map<String, dynamic> _$UpdateGuestResponseToJson(
  _UpdateGuestResponse instance,
) => <String, dynamic>{
  'invitee_id': instance.inviteeId,
  'full_name': instance.fullName,
};
