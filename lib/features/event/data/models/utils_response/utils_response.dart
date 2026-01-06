import 'package:freezed_annotation/freezed_annotation.dart';

part 'utils_response.freezed.dart';
part 'utils_response.g.dart';

@freezed
abstract class UtilsResponse with _$UtilsResponse {
  const factory UtilsResponse({
    SubscriberModel? subscriber,

    @JsonKey(name: 'event_types')
    List<String>? eventTypes,

    @JsonKey(name: 'bundles')
    List<BundleModel>? bundles,

    @JsonKey(name: 'invite_templates')
    List<TemplateModel>? templates,
  }) = _UtilsResponse;

  factory UtilsResponse.fromJson(Map<String, dynamic> json) =>
      _$UtilsResponseFromJson(json);
}

@freezed
abstract class SubscriberModel with _$SubscriberModel {
  const factory SubscriberModel({
    String? name,
    String? subscriber,

    @JsonKey(name: 'first_name')
    String? firstName,

    @JsonKey(name: 'last_name')
    String? lastName,

    String? mobile,
    String? email,

    @JsonKey(name: 'remaining_balance')
    int? remainingBalance,
  }) = _SubscriberModel;

  factory SubscriberModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriberModelFromJson(json);
}

@freezed
abstract class SubscriptionModel with _$SubscriptionModel {
  const factory SubscriptionModel({
    String? name,

    @JsonKey(name: 'subscription_name')
    String? subscriptionName,

    @JsonKey(name: 'max_kroots')
    int? maxKroots,

    @JsonKey(name: 'duration_in_days')
    int? durationInDays,

    @JsonKey(name: 'csv_import')
    int? csvImport,

    @JsonKey(name: 'premium_designs')
    int? premiumDesigns,

    int? operators,

    @JsonKey(name: 'sub_account')
    int? subAccount,

    double? price,
  }) = _SubscriptionModel;

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionModelFromJson(json);
}

@freezed
abstract class BundleModel with _$BundleModel {
  const factory BundleModel({
    String? name,
    double? price,
    int? amount,
  }) = _BundleModel;

  factory BundleModel.fromJson(Map<String, dynamic> json) =>
      _$BundleModelFromJson(json);
}

@freezed
abstract class TemplateModel with _$TemplateModel {
  const factory TemplateModel({
    String? name,
    String? template,

    @JsonKey(name: 'sample_values')
    String? sampleValues,

    @JsonKey(name: 'for_doctype')
    String? forDoctype,

    @JsonKey(name: 'field_names')
    String? fieldNames,

    String? language,
  }) = _TemplateModel;

  factory TemplateModel.fromJson(Map<String, dynamic> json) =>
      _$TemplateModelFromJson(json);
}
