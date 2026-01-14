import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_guest_response.freezed.dart';
part 'update_guest_response.g.dart';

@freezed
abstract class UpdateGuestResponse with _$UpdateGuestResponse {
  const factory UpdateGuestResponse({
    /// JSON key: "invitee_id"
    @JsonKey(name: 'invitee_id') required String inviteeId,

    /// JSON key: "full_name"
    @JsonKey(name: 'full_name') String? fullName,
  }) = _UpdateGuestResponse;

  factory UpdateGuestResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateGuestResponseFromJson(json);
}
