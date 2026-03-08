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
              json['subscriber'] as Map<String, dynamic>),
      eventTypes: (json['event_types'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      bundles: (json['bundles'] as List<dynamic>?)
          ?.map((e) => BundleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      templates: (json['invite_templates'] as List<dynamic>?)
          ?.map((e) => TemplateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UtilsResponseToJson(_UtilsResponse instance) =>
    <String, dynamic>{
      'subscriber': instance.subscriber,
      'event_types': instance.eventTypes,
      'bundles': instance.bundles,
      'invite_templates': instance.templates,
    };

_SubscriberModel _$SubscriberModelFromJson(Map<String, dynamic> json) =>
    _SubscriberModel(
      name: json['name'] as String?,
      subscriber: json['subscriber'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
      remainingBalance: (json['remaining_balance'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SubscriberModelToJson(_SubscriberModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'subscriber': instance.subscriber,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'mobile': instance.mobile,
      'email': instance.email,
      'remaining_balance': instance.remainingBalance,
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

_BundleModel _$BundleModelFromJson(Map<String, dynamic> json) => _BundleModel(
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      amount: (json['amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BundleModelToJson(_BundleModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'amount': instance.amount,
    };

_TemplateModel _$TemplateModelFromJson(Map<String, dynamic> json) =>
    _TemplateModel(
      name: json['name'] as String?,
      template: json['template'] as String?,
      sampleValues: json['sample_values'] as String?,
      forDoctype: json['for_doctype'] as String?,
      fieldNames: json['field_names'] as String?,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$TemplateModelToJson(_TemplateModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'template': instance.template,
      'sample_values': instance.sampleValues,
      'for_doctype': instance.forDoctype,
      'field_names': instance.fieldNames,
      'language': instance.language,
    };
