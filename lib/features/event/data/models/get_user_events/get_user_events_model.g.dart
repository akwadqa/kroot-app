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
    );

Map<String, dynamic> _$GetUserEventsModelToJson(_GetUserEventsModel instance) =>
    <String, dynamic>{'events': instance.events};

_EventModel _$EventModelFromJson(Map<String, dynamic> json) => _EventModel(
  occasionId: json['occasion_id'] as String?,
  title: json['title'] as String?,
  type: json['type'] as String?,
  date: json['date'] as String?,
  language: json['language'] as String?,
  role: json['role'] as String?,
  mapLongitude: json['map_longitude'] as String?,
  mapLatitude: json['map_latitude'] as String?,
  locationName: json['location_name'] as String?,
  showQr: (json['show_qr'] as num?)?.toInt(),
  imageUrl: json['image_url'] as String?,
  inviteTemplate: json['invite_template'] as String?,
  confirmedTemplate: json['confirmed_template'] as String?,
  declinedTemplate: json['declined_template'] as String?,
  workflowState: json['workflow_state'] as String?,
  status: json['status'] as String?,
  guestReport: json['guest_report'] == null
      ? null
      : GuestReportModel.fromJson(json['guest_report'] as Map<String, dynamic>),
  guests: (json['guests'] as List<dynamic>?)
      ?.map((e) => GuestModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  operators: (json['operators'] as List<dynamic>?)
      ?.map((e) => HandlerModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  handlers: (json['handlers'] as List<dynamic>?)
      ?.map((e) => HandlerModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$EventModelToJson(_EventModel instance) =>
    <String, dynamic>{
      'occasion_id': instance.occasionId,
      'title': instance.title,
      'type': instance.type,
      'date': instance.date,
      'language': instance.language,
      'role': instance.role,
      'map_longitude': instance.mapLongitude,
      'map_latitude': instance.mapLatitude,
      'location_name': instance.locationName,
      'show_qr': instance.showQr,
      'image_url': instance.imageUrl,
      'invite_template': instance.inviteTemplate,
      'confirmed_template': instance.confirmedTemplate,
      'declined_template': instance.declinedTemplate,
      'workflow_state': instance.workflowState,
      'status': instance.status,
      'guest_report': instance.guestReport,
      'guests': instance.guests,
      'operators': instance.operators,
      'handlers': instance.handlers,
    };

_GuestReportModel _$GuestReportModelFromJson(Map<String, dynamic> json) =>
    _GuestReportModel(
      totalInvitees: (json['total_invitees'] as num?)?.toInt(),
      notSent: (json['not_sent'] as num?)?.toInt(),
      pending: (json['pending'] as num?)?.toInt(),
      confirmed: (json['confirmed'] as num?)?.toInt(),
      declined: (json['declined'] as num?)?.toInt(),
      failed: (json['failed'] as num?)?.toInt(),
      scannedCount: (json['scanned_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GuestReportModelToJson(_GuestReportModel instance) =>
    <String, dynamic>{
      'total_invitees': instance.totalInvitees,
      'not_sent': instance.notSent,
      'pending': instance.pending,
      'confirmed': instance.confirmed,
      'declined': instance.declined,
      'failed': instance.failed,
      'scanned_count': instance.scannedCount,
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

_HandlerModel _$HandlerModelFromJson(Map<String, dynamic> json) =>
    _HandlerModel(
      whatsappNumber: json['whatsapp_number'] as String?,
      scanAccess: (json['scan_access'] as num?)?.toInt(),
      editEventAccess: (json['edit_event_access'] as num?)?.toInt(),
      guestListAccess: (json['guest_list_access'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HandlerModelToJson(_HandlerModel instance) =>
    <String, dynamic>{
      'whatsapp_number': instance.whatsappNumber,
      'scan_access': instance.scanAccess,
      'edit_event_access': instance.editEventAccess,
      'guest_list_access': instance.guestListAccess,
    };
