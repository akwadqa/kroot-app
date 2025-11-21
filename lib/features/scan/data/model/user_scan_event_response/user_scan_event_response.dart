import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';

part 'user_scan_event_response.freezed.dart';
part 'user_scan_event_response.g.dart';

@freezed
abstract class UserScanEventResponse with _$UserScanEventResponse {
  const factory UserScanEventResponse({
    @JsonKey(name: 'owned_events') required List<EventModel> ownedEvents,
    @JsonKey(name: 'participant_events')
    required List<EventModel> participantEvents,
  }) = _UserScanEventResponse;

  factory UserScanEventResponse.fromJson(Map<String, dynamic> json) =>
      _$UserScanEventResponseFromJson(json);
}
