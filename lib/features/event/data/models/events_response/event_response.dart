// import 'dart:io' show File;
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'event_response.freezed.dart';
// part 'event_response.g.dart';

// /// ✅ محوّل لقيم 0/1 (وأيضًا true/false) إلى bool والعكس (يُرسل 1/0).
// class BoolIntConverter implements JsonConverter<bool?, Object?> {
// const BoolIntConverter();

// @override
// bool? fromJson(Object? json) {
// if (json == null) return null;
// if (json is bool) return json;
// if (json is num) return json != 0;
// if (json is String) {
// final lower = json.toLowerCase().trim();
// if (lower == '1' || lower == 'true') return true;
// if (lower == '0' || lower == 'false') return false;
// }
// return null;
// }

// @override
// Object? toJson(bool? object) => object == null ? null : (object ? 1 : 0);
// }

// /// ✅ محوّل لتاريخ بتنسيق "yyyy-MM-dd HH:mm:ss".
// class DateTimeSpaceConverter implements JsonConverter<DateTime?, String?> {
// const DateTimeSpaceConverter();

// @override
// DateTime? fromJson(String? json) {
// if (json == null || json.isEmpty) return null;
// final isoLike = json.replaceFirst(' ', 'T');
// return DateTime.tryParse(isoLike);
// }

// @override
// String? toJson(DateTime? date) {
// if (date == null) return null;
// final iso = date.toIso8601String();
// final noMillis = iso.split('.').first;
// return noMillis.replaceFirst('T', ' ');
// }
// }

// @freezed
// abstract class EventsResponse with _$EventsResponse {
// const factory EventsResponse({
// @Default(<Event>[]) List<Event> events,
// @JsonKey(name: 'event_types') @Default(<String>[]) List<String> eventTypes,
// }) = _EventsResponse;

// factory EventsResponse.fromJson(Map<String, dynamic> json) =>
// _$EventsResponseFromJson(json);
// }

// @freezed
// abstract class Event with _$Event {
// const factory Event({
// String? name,
// String? type,
// String? title,
// @DateTimeSpaceConverter() @JsonKey(name: 'date') DateTime? date,
// String? language,
// @JsonKey(name: 'map_link') String? mapLink,
// @JsonKey(name: 'location_name') String? locationName,
// @JsonKey(name: 'show_qr') @BoolIntConverter() bool? showQr,
// @JsonKey(name: 'image') String? imagePath,
// @JsonKey(includeFromJson: false, includeToJson: false) File? image,
// @JsonKey(name: 'invite_template') String? inviteTemplate,
// @JsonKey(name: 'confirmed_template') String? confirmedTemplate,
// @JsonKey(name: 'declined_template') String? declinedTemplate,
// int? docstatus,
// String? status,
// @Default(<Guest>[]) List<Guest> guests,
// }) = _Event;

// factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
// }

// @freezed
// abstract class Guest with _$Guest {
// const factory Guest({
// @JsonKey(name: 'invitee_id') String? inviteeId,
// @JsonKey(name: 'full_name') String? fullName,
// @JsonKey(name: 'whatsapp_number') String? whatsappNumber,
// @JsonKey(name: 'party_size') int? partySize,
// }) = _Guest;

// factory Guest.fromJson(Map<String, dynamic> json) => _$GuestFromJson(json);
// }
