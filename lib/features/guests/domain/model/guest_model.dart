// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'guest_model.freezed.dart';
// part 'guest_model.g.dart';

// @freezed
// abstract class GuestModel with _$GuestModel {
//   const factory GuestModel({
//     /// يأتي من invitee_id في JSON
//     @JsonKey(name: 'invitee_id') required String inviteeId,

//     /// JSON: "full_name": "None"
//     @JsonKey(name: 'full_name') String? fullName,

//     /// JSON: first_name, last_name (اختياري)
//     @JsonKey(name: 'first_name') String? firstName,
//     @JsonKey(name: 'last_name') String? lastName,

//     @JsonKey(name: 'whatsapp_number') String? whatsappNumber,

//     /// JSON: "occasion_id": "OCC-XXXX"
//     @JsonKey(name: 'occasion_id') String? occasion,

//     @JsonKey(name: 'occasion_name') String? occasionName,

//     /// JSON: "rsvp_status": "Not Sent"
//     @JsonKey(name: 'rsvp_status', fromJson: rsvpFromApi, toJson: rsvpToApi)
//    required RsvpStatus rsvpStatus,

//     @JsonKey(name: 'party_size') @Default(1) int? partySize,

//     /// JSON doesn't include checkin_count → default = 0 أفضل من 1
//     @JsonKey(name: 'checkin_count') @Default(0) int? checkinCount,

//     /// JSON: "replied": 0
//     @JsonKey(name: 'replied') @Default(0) int? replied,
//   }) = _GuestModel;

//   factory GuestModel.fromJson(Map<String, dynamic> json) =>
//       _$GuestModelFromJson(json);
// }
// enum RsvpStatus {
//   all,
//   confirmed,
//   declined,
//   notSent,
//   failed,
//   pending,
// }

// RsvpStatus rsvpFromApi(String? s) {
//   switch ((s ?? '').toLowerCase()) {
//     case 'all':
//       return RsvpStatus.all;
//     case 'confirmed':
//       return RsvpStatus.confirmed;
//     case 'declined':
//       return RsvpStatus.declined;
//     case 'not sent':   // ← الآن تعمل مع lowercase
//       return RsvpStatus.notSent;
//     case 'failed':
//       return RsvpStatus.failed;
//     default:
//       return RsvpStatus.pending;
//   }
// }

// String rsvpToApi(RsvpStatus s) {
//   switch (s) {
//     case RsvpStatus.confirmed:
//       return "Confirmed";
//     case RsvpStatus.declined:
//       return "Declined";
//     case RsvpStatus.pending:
//       return "Pending";
//     case RsvpStatus.failed:
//       return "Failed";
//     case RsvpStatus.notSent:
//       return "Not Sent";
//     default:
//       return "";
//   }
// }
