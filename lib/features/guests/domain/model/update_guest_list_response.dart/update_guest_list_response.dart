import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_guest_list_response.freezed.dart';
part 'update_guest_list_response.g.dart';

@freezed
abstract class UpdateGuestListRespone with _$UpdateGuestListRespone {
  const factory UpdateGuestListRespone({
    @JsonKey(name: 'occasion_id') required String occasionId,
    @JsonKey(name: 'added_count') required int addedCount,
    @JsonKey(name: 'skipped_count') required int skippedCount,
    @JsonKey(name: 'added_invitees') required List<AddedInvitee> addedInvitees,
  }) = _UpdateGuestListRespone;

  factory UpdateGuestListRespone.fromJson(Map<String, dynamic> json) =>
      _$UpdateGuestListResponeFromJson(json);
}

@freezed
abstract class AddedInvitee with _$AddedInvitee {
  const factory AddedInvitee({
    @JsonKey(name: 'invitee_id') required String inviteeId,
    @JsonKey(name: 'full_name') required String fullName,
  }) = _AddedInvitee;

  factory AddedInvitee.fromJson(Map<String, dynamic> json) =>
      _$AddedInviteeFromJson(json);
}
