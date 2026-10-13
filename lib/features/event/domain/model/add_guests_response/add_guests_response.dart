import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_guests_response.freezed.dart';
part 'add_guests_response.g.dart';

@freezed
abstract class AddGuestsResponse with _$AddGuestsResponse {
  const factory AddGuestsResponse({
    @JsonKey(name: 'occasion_id') required String occasionId,
    @JsonKey(name: 'created_invitees')
    required List<Invitee> createdInvitees,
    required List<dynamic> duplicates,
  }) = _AddGuestsResponse;

  factory AddGuestsResponse.fromJson(Map<String, dynamic> json) =>
      _$AddGuestsResponseFromJson(json);
}

@freezed
abstract class Invitee with _$Invitee {
  const factory Invitee({
    @JsonKey(name: 'invitee_id') required String inviteeId,
    @JsonKey(name: 'full_name') required String fullName,
  }) = _Invitee;

  factory Invitee.fromJson(Map<String, dynamic> json) =>
      _$InviteeFromJson(json);
}
