// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_preview_card_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConfirmPreviewCardResponse _$ConfirmPreviewCardResponseFromJson(
        Map<String, dynamic> json) =>
    _ConfirmPreviewCardResponse(
      name: json['name'] as String,
      finalImage: json['final_image'] as String,
      amount: json['amount'] as num,
    );

Map<String, dynamic> _$ConfirmPreviewCardResponseToJson(
        _ConfirmPreviewCardResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'final_image': instance.finalImage,
      'amount': instance.amount,
    };
