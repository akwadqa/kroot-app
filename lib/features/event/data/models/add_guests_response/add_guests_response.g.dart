// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_guests_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddGuestsResponse _$AddGuestsResponseFromJson(Map<String, dynamic> json) =>
    _AddGuestsResponse(
      occasionId: json['occasion_id'] as String,
      createdInvitees: (json['created_invitees'] as List<dynamic>)
          .map((e) => Invitee.fromJson(e as Map<String, dynamic>))
          .toList(),
      duplicates: json['duplicates'] as List<dynamic>,
    );

Map<String, dynamic> _$AddGuestsResponseToJson(_AddGuestsResponse instance) =>
    <String, dynamic>{
      'occasion_id': instance.occasionId,
      'created_invitees': instance.createdInvitees,
      'duplicates': instance.duplicates,
    };

_Invitee _$InviteeFromJson(Map<String, dynamic> json) => _Invitee(
  inviteeId: json['invitee_id'] as String,
  fullName: json['full_name'] as String,
);

Map<String, dynamic> _$InviteeToJson(_Invitee instance) => <String, dynamic>{
  'invitee_id': instance.inviteeId,
  'full_name': instance.fullName,
};
