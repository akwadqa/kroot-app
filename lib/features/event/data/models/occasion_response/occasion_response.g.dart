// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occasion_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OccasionModel _$OccasionModelFromJson(Map<String, dynamic> json) =>
    _OccasionModel(
      occasionId: json['occasion_id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      date: json['date'] as String,
      language: json['language'] as String,
      mapLink: json['map_link'] as String,
      locationName: json['location_name'] as String,
      showQr: (json['show_qr'] as num).toInt(),
      image: json['image'] as String,
      inviteTemplate: json['invite_template'] as String,
      confirmedTemplate: json['confirmed_template'] as String,
      declinedTemplate: json['declined_template'] as String,
      status: json['status'] as String,
      guests: (json['guests'] as List<dynamic>)
          .map((e) => GuestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OccasionModelToJson(_OccasionModel instance) =>
    <String, dynamic>{
      'occasion_id': instance.occasionId,
      'type': instance.type,
      'title': instance.title,
      'date': instance.date,
      'language': instance.language,
      'map_link': instance.mapLink,
      'location_name': instance.locationName,
      'show_qr': instance.showQr,
      'image': instance.image,
      'invite_template': instance.inviteTemplate,
      'confirmed_template': instance.confirmedTemplate,
      'declined_template': instance.declinedTemplate,
      'status': instance.status,
      'guests': instance.guests,
    };

_GuestModel _$GuestModelFromJson(Map<String, dynamic> json) => _GuestModel(
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  whatsappNumber: json['whatsapp_number'] as String,
  partySize: (json['party_size'] as num).toInt(),
);

Map<String, dynamic> _$GuestModelToJson(_GuestModel instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'whatsapp_number': instance.whatsappNumber,
      'party_size': instance.partySize,
    };
