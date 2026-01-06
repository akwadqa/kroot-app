// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkin_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckinItem _$CheckinItemFromJson(Map<String, dynamic> json) => _CheckinItem(
  invitee: json['invitee'] as String?,
  occasion: json['occasion'] as String?,
  checkedIn: _checkedInToInt(json['checked_in']),
  partySize: (json['party_size'] as num?)?.toInt(),
);

Map<String, dynamic> _$CheckinItemToJson(_CheckinItem instance) =>
    <String, dynamic>{
      'invitee': instance.invitee,
      'occasion': instance.occasion,
      'checked_in': instance.checkedIn,
      'party_size': instance.partySize,
    };

_CheckinPayload _$CheckinPayloadFromJson(Map<String, dynamic> json) =>
    _CheckinPayload(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => CheckinItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <CheckinItem>[],
    );

Map<String, dynamic> _$CheckinPayloadToJson(_CheckinPayload instance) =>
    <String, dynamic>{'items': instance.items};
