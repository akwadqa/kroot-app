import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_guest_response.freezed.dart';
part 'update_guest_response.g.dart';

@freezed
abstract class UpdateGuestResponse with _$UpdateGuestResponse {
  const factory UpdateGuestResponse({
    @JsonKey(name: 'invitee_id') required String inviteeId,

    @JsonKey(name: 'full_name') String? fullName,
  }) = _UpdateGuestResponse;

  factory UpdateGuestResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateGuestResponseFromJson(json);
}
