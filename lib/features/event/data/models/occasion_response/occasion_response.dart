// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'occasion_response.freezed.dart';
// part 'occasion_response.g.dart';

// @freezed
// abstract class OccasionModel with _$OccasionModel {
//   const factory OccasionModel({
//     @JsonKey(name: 'occasion_id')   String? occasionId,
//      String? type,
//       String? title,
//       String? date,
//       String? language,
//     @JsonKey(name: 'map_link')   String? mapLink,
//     @JsonKey(name: 'location_name')   String? locationName,
//     @JsonKey(name: 'show_qr')   int? showQr,
//       String? image,
//     @JsonKey(name: 'invite_template')   String? inviteTemplate,
//     @JsonKey(name: 'confirmed_template')   String? confirmedTemplate,
//     @JsonKey(name: 'declined_template')   String? declinedTemplate,
//       String? status,
//       List<GuestModel>? guests,
//   }) = _OccasionModel;

//   factory OccasionModel.fromJson(Map<String, dynamic> json) =>
//       _$OccasionModelFromJson(json);
// }

// @freezed
// abstract class GuestModel with _$GuestModel {
//   const factory GuestModel({
//     @JsonKey(name: 'first_name')   String? firstName,
//     @JsonKey(name: 'last_name')   String? lastName,
//     @JsonKey(name: 'whatsapp_number')   String? whatsappNumber,
//     @JsonKey(name: 'party_size')   int? partySize,
//   }) = _GuestModel;

//   factory GuestModel.fromJson(Map<String, dynamic> json) =>
//       _$GuestModelFromJson(json);
// }
