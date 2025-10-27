import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_event_response.freezed.dart';
part 'create_event_response.g.dart';

@freezed
abstract class CreateEventResponse with _$CreateEventResponse {
  const factory CreateEventResponse({
    @JsonKey(name: 'event_id') required String eventId,
    required String image,
  }) = _CreateEventResponse;

  factory CreateEventResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateEventResponseFromJson(json);
}
