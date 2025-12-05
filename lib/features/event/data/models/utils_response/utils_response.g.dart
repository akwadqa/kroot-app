// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utils_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UtilsResponse _$UtilsResponseFromJson(Map<String, dynamic> json) =>
    _UtilsResponse(
      subscriber: json['subscriber'] == null
          ? null
          : SubscriberModel.fromJson(
              json['subscriber'] as Map<String, dynamic>,
            ),
      eventTypes: (json['event_types'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      subscriptions: (json['subscriptions'] as List<dynamic>?)
          ?.map((e) => SubscriptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UtilsResponseToJson(_UtilsResponse instance) =>
    <String, dynamic>{
      'subscriber': instance.subscriber,
      'event_types': instance.eventTypes,
      'subscriptions': instance.subscriptions,
    };

_SubscriberModel _$SubscriberModelFromJson(Map<String, dynamic> json) =>
    _SubscriberModel(
      name: json['name'] as String?,
      subscriptionType: json['subscription_type'] as String?,
      expiryDate: json['expiry_date'] as String?,
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
      maxKroots: (json['max_kroots'] as num?)?.toInt(),
      remainingKroots: (json['remaining_kroots'] as num?)?.toInt(),
      csvImport: (json['csv_import'] as num?)?.toInt(),
      premiumDesigns: (json['premium_designs'] as num?)?.toInt(),
      operators: (json['operators'] as num?)?.toInt(),
      subAccount: (json['sub_account'] as num?)?.toInt(),
      subscriber: json['subscriber'] as String?,
    );

Map<String, dynamic> _$SubscriberModelToJson(_SubscriberModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'subscription_type': instance.subscriptionType,
      'expiry_date': instance.expiryDate,
      'mobile': instance.mobile,
      'email': instance.email,
      'max_kroots': instance.maxKroots,
      'remaining_kroots': instance.remainingKroots,
      'csv_import': instance.csvImport,
      'premium_designs': instance.premiumDesigns,
      'operators': instance.operators,
      'sub_account': instance.subAccount,
      'subscriber': instance.subscriber,
    };

_SubscriptionModel _$SubscriptionModelFromJson(Map<String, dynamic> json) =>
    _SubscriptionModel(
      name: json['name'] as String?,
      subscriptionName: json['subscription_name'] as String?,
      maxKroots: (json['max_kroots'] as num?)?.toInt(),
      durationInDays: (json['duration_in_days'] as num?)?.toInt(),
      csvImport: (json['csv_import'] as num?)?.toInt(),
      premiumDesigns: (json['premium_designs'] as num?)?.toInt(),
      operators: (json['operators'] as num?)?.toInt(),
      subAccount: (json['sub_account'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SubscriptionModelToJson(_SubscriptionModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'subscription_name': instance.subscriptionName,
      'max_kroots': instance.maxKroots,
      'duration_in_days': instance.durationInDays,
      'csv_import': instance.csvImport,
      'premium_designs': instance.premiumDesigns,
      'operators': instance.operators,
      'sub_account': instance.subAccount,
      'price': instance.price,
    };
