// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EventsResponse _$EventsResponseFromJson(Map<String, dynamic> json) =>
    _EventsResponse(
      events:
          (json['events'] as List<dynamic>?)
              ?.map((e) => Event.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Event>[],
      eventTypes:
          (json['event_types'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$EventsResponseToJson(_EventsResponse instance) =>
    <String, dynamic>{
      'events': instance.events,
      'event_types': instance.eventTypes,
    };

_Event _$EventFromJson(Map<String, dynamic> json) => _Event(
  name: json['name'] as String,
  type: json['type'] as String,
  title: json['title'] as String,
  date: const DateTimeSpaceConverter().fromJson(json['date'] as String),
  language: json['language'] as String,
  mapLink: json['map_link'] as String,
  locationName: json['location_name'] as String,
  showQr: const BoolIntConverter().fromJson(json['show_qr']),
  imagePath: json['image'] as String?,
  inviteTemplate: json['invite_template'] as String?,
  confirmedTemplate: json['confirmed_template'] as String?,
  declinedTemplate: json['declined_template'] as String?,
  docstatus: (json['docstatus'] as num).toInt(),
  status: json['status'] as String,
  guests:
      (json['guests'] as List<dynamic>?)
          ?.map((e) => Guest.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Guest>[],
);

Map<String, dynamic> _$EventToJson(_Event instance) => <String, dynamic>{
  'name': instance.name,
  'type': instance.type,
  'title': instance.title,
  'date': const DateTimeSpaceConverter().toJson(instance.date),
  'language': instance.language,
  'map_link': instance.mapLink,
  'location_name': instance.locationName,
  'show_qr': const BoolIntConverter().toJson(instance.showQr),
  'image': instance.imagePath,
  'invite_template': instance.inviteTemplate,
  'confirmed_template': instance.confirmedTemplate,
  'declined_template': instance.declinedTemplate,
  'docstatus': instance.docstatus,
  'status': instance.status,
  'guests': instance.guests,
};

_Guest _$GuestFromJson(Map<String, dynamic> json) => _Guest(
  inviteeId: json['invitee_id'] as String,
  fullName: json['full_name'] as String,
  whatsappNumber: json['whatsapp_number'] as String,
  partySize: (json['party_size'] as num).toInt(),
);

Map<String, dynamic> _$GuestToJson(_Guest instance) => <String, dynamic>{
  'invitee_id': instance.inviteeId,
  'full_name': instance.fullName,
  'whatsapp_number': instance.whatsappNumber,
  'party_size': instance.partySize,
};
