// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retry_bulk_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RetryBulkResponse _$RetryBulkResponseFromJson(Map<String, dynamic> json) =>
    _RetryBulkResponse(
      occasionId: json['occasion_id'] as String,
      totalBulkMessages: (json['total_bulk_messages'] as num).toInt(),
      retriedCount: (json['retried_count'] as num).toInt(),
      failedCount: (json['failed_count'] as num).toInt(),
      failedBulkMessages: (json['failed_bulk_messages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      retried: (json['retried'] as List<dynamic>)
          .map((e) => RetriedBulkMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RetryBulkResponseToJson(_RetryBulkResponse instance) =>
    <String, dynamic>{
      'occasion_id': instance.occasionId,
      'total_bulk_messages': instance.totalBulkMessages,
      'retried_count': instance.retriedCount,
      'failed_count': instance.failedCount,
      'failed_bulk_messages': instance.failedBulkMessages,
      'retried': instance.retried,
    };

_RetriedBulkMessage _$RetriedBulkMessageFromJson(Map<String, dynamic> json) =>
    _RetriedBulkMessage(
      bulkMessage: json['bulk_message'] as String,
      result: json['result'] as bool,
    );

Map<String, dynamic> _$RetriedBulkMessageToJson(_RetriedBulkMessage instance) =>
    <String, dynamic>{
      'bulk_message': instance.bulkMessage,
      'result': instance.result,
    };
