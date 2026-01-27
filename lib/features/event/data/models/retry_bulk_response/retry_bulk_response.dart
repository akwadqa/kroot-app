import 'package:freezed_annotation/freezed_annotation.dart';

part 'retry_bulk_response.freezed.dart';
part 'retry_bulk_response.g.dart';

@freezed
abstract class RetryBulkResponse with _$RetryBulkResponse {
  const factory RetryBulkResponse({
    @JsonKey(name: 'occasion_id') required String occasionId,
    @JsonKey(name: 'total_bulk_messages') required int totalBulkMessages,
    @JsonKey(name: 'retried_count') required int retriedCount,
    @JsonKey(name: 'failed_count') required int failedCount,
    @JsonKey(name: 'failed_bulk_messages')
        required List<String> failedBulkMessages,
    required List<RetriedBulkMessage> retried,
  }) = _RetryBulkResponse;

  factory RetryBulkResponse.fromJson(Map<String, dynamic> json) =>
      _$RetryBulkResponseFromJson(json);
}

@freezed
abstract class RetriedBulkMessage with _$RetriedBulkMessage {
  const factory RetriedBulkMessage({
    @JsonKey(name: 'bulk_message') required String bulkMessage,
    required bool result,
  }) = _RetriedBulkMessage;

  factory RetriedBulkMessage.fromJson(Map<String, dynamic> json) =>
      _$RetriedBulkMessageFromJson(json);
}
