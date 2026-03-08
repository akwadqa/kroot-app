// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_event_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConfirmEventResponse _$ConfirmEventResponseFromJson(
        Map<String, dynamic> json) =>
    _ConfirmEventResponse(
      occasionId: json['occasion_id'] as String,
      recipientList: json['recipient_list'] as String,
      bulkMessage: json['bulk_message'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$ConfirmEventResponseToJson(
        _ConfirmEventResponse instance) =>
    <String, dynamic>{
      'occasion_id': instance.occasionId,
      'recipient_list': instance.recipientList,
      'bulk_message': instance.bulkMessage,
      'status': instance.status,
    };
