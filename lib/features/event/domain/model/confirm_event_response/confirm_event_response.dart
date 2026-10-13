import 'package:freezed_annotation/freezed_annotation.dart';

part 'confirm_event_response.freezed.dart';
part 'confirm_event_response.g.dart';

@freezed
abstract class ConfirmEventResponse with _$ConfirmEventResponse {
  const factory ConfirmEventResponse({
    @JsonKey(name: 'occasion_id') required String occasionId,
    @JsonKey(name: 'recipient_list') required String recipientList,
    @JsonKey(name: 'bulk_message') required String bulkMessage,
    required String status,
  }) = _ConfirmEventResponse;

  factory ConfirmEventResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfirmEventResponseFromJson(json);
}
