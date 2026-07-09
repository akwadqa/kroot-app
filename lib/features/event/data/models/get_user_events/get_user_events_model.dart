import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kroot_app/features/cards/domain/confirm_card_preview_response/confirm_preview_card_response.dart';

part 'get_user_events_model.freezed.dart';
part 'get_user_events_model.g.dart';

@freezed
abstract class GetUserEventsModel with _$GetUserEventsModel {
  const factory GetUserEventsModel({
    @JsonKey(name: 'event') List<EventModel>? events,
    @JsonKey(name: 'kroot') List<ConfirmPreviewCardResponse>? kroot,
    @JsonKey(name: 'categories') List<String>? categories,
  }) = _GetUserEventsModel;

  factory GetUserEventsModel.fromJson(Map<String, dynamic> json) =>
      _$GetUserEventsModelFromJson(json);
}

@freezed
abstract class EventModel with _$EventModel {
  const factory EventModel({
    @JsonKey(name: 'occasion_id') String? occasionId,
    String? title,
    String? type,
    String? date,
    String? language,
    String? role,

    @JsonKey(name: 'map_longitude') String? mapLongitude,
    @JsonKey(name: 'map_latitude') String? mapLatitude,
    @JsonKey(name: 'location_name') String? locationName,

    @JsonKey(name: 'show_qr') int? showQr,
    @JsonKey(name: 'image_url') String? imageUrl,

    @JsonKey(includeFromJson: false) File? image,

    @JsonKey(name: 'invite_template') String? inviteTemplate,
    @JsonKey(name: 'confirmed_template') String? confirmedTemplate,
    @JsonKey(name: 'declined_template') String? declinedTemplate,

    @JsonKey(name: 'workflow_state') String? workflowState,
    String? status,

    @JsonKey(name: 'guest_report') GuestReportModel? guestReport,

    @JsonKey(name: 'guests') List<GuestModel>? guests,
    @JsonKey(name: 'operators') List<HandlerModel>? operators,
    @JsonKey(name: 'handlers') List<HandlerModel>? handlers,
  }) = _EventModel;

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);
}

@freezed
abstract class GuestReportModel with _$GuestReportModel {
  const factory GuestReportModel({
    @JsonKey(name: 'total_invitees') int? totalInvitees,
    @JsonKey(name: 'not_sent') int? notSent,
    @JsonKey(name: 'pending') int? pending,
    @JsonKey(name: 'confirmed') int? confirmed,
    @JsonKey(name: 'declined') int? declined,
    @JsonKey(name: 'failed') int? failed,
    @JsonKey(name: 'scanned_count') int? scannedCount,
  }) = _GuestReportModel;

  factory GuestReportModel.fromJson(Map<String, dynamic> json) =>
      _$GuestReportModelFromJson(json);
}

@freezed
abstract class GuestModel with _$GuestModel {
  const factory GuestModel({
    @JsonKey(name: 'invitee_id') String? inviteeId,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'whatsapp_number') String? whatsappNumber,
    @JsonKey(name: 'party_size') int? partySize,
    @JsonKey(name: 'rsvp_status') String? rsvpStatus,
    @JsonKey(name: 'replied') int? replied,
  }) = _GuestModel;

  factory GuestModel.fromJson(Map<String, dynamic> json) =>
      _$GuestModelFromJson(json);
}

@freezed
abstract class HandlerModel with _$HandlerModel {
  const factory HandlerModel({
    @JsonKey(name: 'whatsapp_number') String? whatsappNumber,
    @JsonKey(name: 'scan_access') int? scanAccess,
    @JsonKey(name: 'edit_event_access') int? editEventAccess,
    @JsonKey(name: 'guest_list_access') int? guestListAccess,
  }) = _HandlerModel;

  factory HandlerModel.fromJson(Map<String, dynamic> json) =>
      _$HandlerModelFromJson(json);
}
