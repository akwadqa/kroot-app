part of 'create_event_response.dart';

_CreateEventResponse _$CreateEventResponseFromJson(Map<String, dynamic> json) =>
    _CreateEventResponse(
      eventId: json['event_id'] as String?,
      occasionId: json['occasion_id'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CreateEventResponseToJson(
  _CreateEventResponse instance,
) => <String, dynamic>{
  'event_id': instance.eventId,
  'occasion_id': instance.occasionId,
  'image': instance.image,
};
