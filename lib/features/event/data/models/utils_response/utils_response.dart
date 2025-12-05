import 'package:freezed_annotation/freezed_annotation.dart';

part 'utils_response.freezed.dart';
part 'utils_response.g.dart';

@freezed
abstract class UtilsResponse with _$UtilsResponse {
  const factory UtilsResponse({
    SubscriberModel? subscriber,
    @JsonKey(name: 'event_types') List<String>? eventTypes,
    @JsonKey(name: 'subscriptions') List<SubscriptionModel>? subscriptions,
  }) = _UtilsResponse;

  factory UtilsResponse.fromJson(Map<String, dynamic> json) =>
      _$UtilsResponseFromJson(json);
}

@freezed
abstract class SubscriberModel with _$SubscriberModel {
  const factory SubscriberModel({
    String? name,
    @JsonKey(name: 'subscription_type') String? subscriptionType,
    @JsonKey(name: 'expiry_date') String? expiryDate,
    String? mobile,
    String? email,
    @JsonKey(name: 'max_kroots') int? maxKroots,
    @JsonKey(name: 'remaining_kroots') int? remainingKroots,
    @JsonKey(name: 'csv_import') int? csvImport,
    @JsonKey(name: 'premium_designs') int? premiumDesigns,
    int? operators,
    @JsonKey(name: 'sub_account') int? subAccount,
    String? subscriber,
  }) = _SubscriberModel;

  factory SubscriberModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriberModelFromJson(json);
}
@freezed
abstract class SubscriptionModel with _$SubscriptionModel {
  const factory SubscriptionModel({
    String? name,
    @JsonKey(name: 'subscription_name') String? subscriptionName,
    @JsonKey(name: 'max_kroots') int? maxKroots,
    @JsonKey(name: 'duration_in_days') int? durationInDays,
    @JsonKey(name: 'csv_import') int? csvImport,
    @JsonKey(name: 'premium_designs') int? premiumDesigns,
    int? operators,
    @JsonKey(name: 'sub_account') int? subAccount,
    double? price,
  }) = _SubscriptionModel;

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionModelFromJson(json);
}

