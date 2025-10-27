// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_event_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateEventResponse _$CreateEventResponseFromJson(Map<String, dynamic> json) =>
    _CreateEventResponse(
      eventId: json['event_id'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$CreateEventResponseToJson(
  _CreateEventResponse instance,
) => <String, dynamic>{'event_id': instance.eventId, 'image': instance.image};
