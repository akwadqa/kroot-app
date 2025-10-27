// lib/models/events_response.dart
import 'dart:io' show File;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_response.freezed.dart';
part 'event_response.g.dart';

/// محوّل لقيم 0/1 (وأيضًا true/false) إلى bool والعكس (يُرسل 1/0).
class BoolIntConverter implements JsonConverter<bool, Object?> {
  const BoolIntConverter();

  @override
  bool fromJson(Object? json) {
    if (json is bool) return json;
    if (json is num) return json != 0;
    if (json is String) {
      final lower = json.toLowerCase().trim();
      if (lower == '1' || lower == 'true') return true;
      if (lower == '0' || lower == 'false') return false;
    }
    // قيمة غير متوقعة: اعتبرها false افتراضيًا
    return false;
  }

  @override
  Object toJson(bool object) => object ? 1 : 0;
}

/// محوّل لتاريخ بتنسيق "yyyy-MM-dd HH:mm:ss".
/// للبساطة: نستخدم استبدال المسافة بـ 'T' ليتوافق مع DateTime.parse.
/// وعند الإرسال نُرجعه "YYYY-MM-DD HH:MM:SS" بدون الميلي ثانية.
class DateTimeSpaceConverter implements JsonConverter<DateTime, String> {
  const DateTimeSpaceConverter();

  @override
  DateTime fromJson(String json) {
    // مثال: "2025-10-28 00:00:00" => استبدال المسافة بـ 'T'
    final isoLike = json.replaceFirst(' ', 'T');
    return DateTime.parse(isoLike);
  }

  @override
  String toJson(DateTime date) {
    // "YYYY-MM-DDTHH:MM:SS.mmmZ" => "YYYY-MM-DD HH:MM:SS"
    final iso = date.toIso8601String();
    final noMillis = iso.split('.').first; // حتى قبل الميلي ثانية
    return noMillis.replaceFirst('T', ' ');
  }
}

@freezed
abstract class EventsResponse with _$EventsResponse {
  const factory EventsResponse({
    @Default(<Event>[]) List<Event> events,
    @JsonKey(name: 'event_types') @Default(<String>[]) List<String> eventTypes,
  }) = _EventsResponse;

  factory EventsResponse.fromJson(Map<String, dynamic> json) =>
      _$EventsResponseFromJson(json);
}

@freezed
abstract class Event with _$Event {
  const factory Event({
    /// "OCC-2025-029"
    required String name,

    /// "Birthday"
    required String type,

    /// "Amine"
    required String title,

    /// "2025-10-28 00:00:00"
    @DateTimeSpaceConverter() @JsonKey(name: 'date') required DateTime date,

    /// "English" / "test"
    required String language,

    /// "https://goo.gl/maps/testing"
    @JsonKey(name: 'map_link') required String mapLink,

    /// "Qatar"
    @JsonKey(name: 'location_name') required String locationName,

    /// 1 => true, 0 => false
    @JsonKey(name: 'show_qr') @BoolIntConverter() required bool showQr,

    /// "/files/event_image_20251021165520_,3pei4o3fno4j.jpg"
    @JsonKey(name: 'image') String? imagePath,

    /// مُستبعد من JSON — مفيد للرفع عبر multipart
    @JsonKey(includeFromJson: false, includeToJson: false) File? image,

    /// "Test-" أو null
    @JsonKey(name: 'invite_template') String? inviteTemplate,

    /// null
    @JsonKey(name: 'confirmed_template') String? confirmedTemplate,

    /// null
    @JsonKey(name: 'declined_template') String? declinedTemplate,

    /// 0
    required int docstatus,

    /// "Draft"
    required String status,

    /// قائمة الضيوف
    @Default(<Guest>[]) List<Guest> guests,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}

@freezed
abstract class Guest with _$Guest {
  const factory Guest({
    @JsonKey(name: 'invitee_id') required String inviteeId,
    @JsonKey(name: 'full_name') required String fullName,
    @JsonKey(name: 'whatsapp_number') required String whatsappNumber,
    @JsonKey(name: 'party_size') required int partySize,
  }) = _Guest;

  factory Guest.fromJson(Map<String, dynamic> json) => _$GuestFromJson(json);
}
