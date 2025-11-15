// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_events_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetUserEventsModel _$GetUserEventsModelFromJson(Map<String, dynamic> json) =>
    _GetUserEventsModel(
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => EventModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      eventTypes: (json['event_types'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$GetUserEventsModelToJson(_GetUserEventsModel instance) =>
    <String, dynamic>{
      'events': instance.events,
      'event_types': instance.eventTypes,
    };

_EventModel _$EventModelFromJson(Map<String, dynamic> json) => _EventModel(
  occasionId: json['occasion_id'] as String?,
  title: json['title'] as String?,
  type: json['type'] as String?,
  date: json['date'] as String?,
  language: json['language'] as String?,
  mapLink: json['map_link'] as String?,
  locationName: json['location_name'] as String?,
  showQr: (json['show_qr'] as num?)?.toInt(),
  imageUrl: json['image_url'] as String?,
  inviteTemplate: json['invite_template'] as String?,
  confirmedTemplate: json['confirmed_template'] as String?,
  declinedTemplate: json['declined_template'] as String?,
  workflowState: json['workflow_state'] as String?,
  status: json['status'] as String?,
  guests: (json['guests'] as List<dynamic>?)
      ?.map((e) => GuestModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$EventModelToJson(_EventModel instance) =>
    <String, dynamic>{
      'occasion_id': instance.occasionId,
      'title': instance.title,
      'type': instance.type,
      'date': instance.date,
      'language': instance.language,
      'map_link': instance.mapLink,
      'location_name': instance.locationName,
      'show_qr': instance.showQr,
      'image_url': instance.imageUrl,
      'invite_template': instance.inviteTemplate,
      'confirmed_template': instance.confirmedTemplate,
      'declined_template': instance.declinedTemplate,
      'workflow_state': instance.workflowState,
      'status': instance.status,
    };

_GuestModel _$GuestModelFromJson(Map<String, dynamic> json) => _GuestModel(
  inviteeId: json['invitee_id'] as String?,
  fullName: json['full_name'] as String?,
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  whatsappNumber: json['whatsapp_number'] as String?,
  partySize: (json['party_size'] as num?)?.toInt(),
  rsvpStatus: json['rsvp_status'] as String?,
  replied: (json['replied'] as num?)?.toInt(),
);

Map<String, dynamic> _$GuestModelToJson(_GuestModel instance) =>
    <String, dynamic>{
      'invitee_id': instance.inviteeId,
      'full_name': instance.fullName,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'whatsapp_number': instance.whatsappNumber,
      'party_size': instance.partySize,
      'rsvp_status': instance.rsvpStatus,
      'replied': instance.replied,
    };
