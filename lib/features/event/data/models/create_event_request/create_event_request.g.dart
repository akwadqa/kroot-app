// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_event_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateEventRequest _$CreateEventRequestFromJson(Map<String, dynamic> json) =>
    _CreateEventRequest(
      type: json['type'] as String?,
      title: json['title'] as String?,
      date: json['date'] as String?,
      language: json['language'] as String?,
      map_link: json['map_link'] as String?,
      location_name: json['location_name'] as String?,
      show_qr: json['show_qr'] as String?,
      invite_template: json['invite_template'] as String?,
      confirmed_template: json['confirmed_template'] as String?,
      declined_template: json['declined_template'] as String?,
      guest_list: (json['guest_list'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$CreateEventRequestToJson(_CreateEventRequest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'date': instance.date,
      'language': instance.language,
      'map_link': instance.map_link,
      'location_name': instance.location_name,
      'show_qr': instance.show_qr,
      'invite_template': instance.invite_template,
      'confirmed_template': instance.confirmed_template,
      'declined_template': instance.declined_template,
      'guest_list': instance.guest_list,
    };

_GuestModel _$GuestModelFromJson(Map<String, dynamic> json) => _GuestModel(
  first_name: json['first_name'] as String?,
  last_name: json['last_name'] as String?,
  whatsapp_number: json['whatsapp_number'] as String?,
  party_size: (json['party_size'] as num?)?.toInt(),
);

Map<String, dynamic> _$GuestModelToJson(_GuestModel instance) =>
    <String, dynamic>{
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'whatsapp_number': instance.whatsapp_number,
      'party_size': instance.party_size,
    };
