// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_scan_event_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserScanEventResponse _$UserScanEventResponseFromJson(
  Map<String, dynamic> json,
) => _UserScanEventResponse(
  ownedEvents: (json['owned_events'] as List<dynamic>)
      .map((e) => EventModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  participantEvents: (json['participant_events'] as List<dynamic>)
      .map((e) => EventModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UserScanEventResponseToJson(
  _UserScanEventResponse instance,
) => <String, dynamic>{
  'owned_events': instance.ownedEvents,
  'participant_events': instance.participantEvents,
};
