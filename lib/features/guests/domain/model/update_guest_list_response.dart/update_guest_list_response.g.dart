// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_guest_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateGuestListRespone _$UpdateGuestListResponeFromJson(
        Map<String, dynamic> json) =>
    _UpdateGuestListRespone(
      occasionId: json['occasion_id'] as String,
      addedCount: (json['added_count'] as num).toInt(),
      skippedCount: (json['skipped_count'] as num).toInt(),
      addedInvitees: (json['added_invitees'] as List<dynamic>)
          .map((e) => AddedInvitee.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UpdateGuestListResponeToJson(
        _UpdateGuestListRespone instance) =>
    <String, dynamic>{
      'occasion_id': instance.occasionId,
      'added_count': instance.addedCount,
      'skipped_count': instance.skippedCount,
      'added_invitees': instance.addedInvitees,
    };

_AddedInvitee _$AddedInviteeFromJson(Map<String, dynamic> json) =>
    _AddedInvitee(
      inviteeId: json['invitee_id'] as String,
      fullName: json['full_name'] as String,
    );

Map<String, dynamic> _$AddedInviteeToJson(_AddedInvitee instance) =>
    <String, dynamic>{
      'invitee_id': instance.inviteeId,
      'full_name': instance.fullName,
    };
