// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_qr_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScanQrResponse _$ScanQrResponseFromJson(Map<String, dynamic> json) =>
    _ScanQrResponse(
      invitee: json['invitee'] as String,
      occasion: json['occasion'] as String,
      checkedIn: (json['checked_in'] as num).toInt(),
      partySize: (json['party_size'] as num).toInt(),
    );

Map<String, dynamic> _$ScanQrResponseToJson(_ScanQrResponse instance) =>
    <String, dynamic>{
      'invitee': instance.invitee,
      'occasion': instance.occasion,
      'checked_in': instance.checkedIn,
      'party_size': instance.partySize,
    };
