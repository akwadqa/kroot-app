import 'package:freezed_annotation/freezed_annotation.dart';

part 'occasion_response.freezed.dart';
part 'occasion_response.g.dart';

@freezed
abstract class OccasionModel with _$OccasionModel {
  const factory OccasionModel({
    @JsonKey(name: 'occasion_id') required String occasionId,
    required String type,
    required String title,
    required String date,
    required String language,
    @JsonKey(name: 'map_link') required String mapLink,
    @JsonKey(name: 'location_name') required String locationName,
    @JsonKey(name: 'show_qr') required int showQr,
    required String image,
    @JsonKey(name: 'invite_template') required String inviteTemplate,
    @JsonKey(name: 'confirmed_template') required String confirmedTemplate,
    @JsonKey(name: 'declined_template') required String declinedTemplate,
    required String status,
    required List<GuestModel> guests,
  }) = _OccasionModel;

  factory OccasionModel.fromJson(Map<String, dynamic> json) =>
      _$OccasionModelFromJson(json);
}

@freezed
abstract class GuestModel with _$GuestModel {
  const factory GuestModel({
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'whatsapp_number') required String whatsappNumber,
    @JsonKey(name: 'party_size') required int partySize,
  }) = _GuestModel;

  factory GuestModel.fromJson(Map<String, dynamic> json) =>
      _$GuestModelFromJson(json);
}
