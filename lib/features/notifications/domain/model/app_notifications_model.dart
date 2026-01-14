
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_notifications_model.freezed.dart';
part 'app_notifications_model.g.dart';
@freezed
abstract class AppNotificationsModel with _$AppNotificationsModel {
  const factory AppNotificationsModel({
    @JsonKey(name: 'app_message_id') required String appMessageId,
    @JsonKey(name: 'app_message_title') required String? appMessageTitle,
    @JsonKey(name: 'app_message_icon') required String? appMessageIcon,
    required String type,
    required String? item,

    @JsonKey(name: "published_on") required String? publishedOn,
    @JsonKey(name: "expiry_date") required String? expiryDate,
    @JsonKey(name: "content") required String? content,
  }) = _AppNotificationsModel;

  factory AppNotificationsModel.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationsModelFromJson(json);
}
