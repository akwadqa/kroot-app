import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_event_request.freezed.dart';
part 'create_event_request.g.dart';

@freezed
abstract class CreateEventRequest with _$CreateEventRequest {
  const factory CreateEventRequest({
    String? type,
    String? title,
    String? date,
    String? language,
    String? map_link,
    String? location_name,
    String? show_qr,

    @JsonKey(includeFromJson: false, includeToJson: false) File? image,

    String? invite_template,
    String? confirmed_template,
    String? declined_template,
    List<Map<String,dynamic>>? guest_list,
  }) = _CreateEventRequest;

  factory CreateEventRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateEventRequestFromJson(json);
}

@freezed
abstract class GuestModel with _$GuestModel {
  const factory GuestModel({
    String? first_name,
    String? last_name,
    String? whatsapp_number,
    int? party_size,
  }) = _GuestModel;

  factory GuestModel.fromJson(Map<String, dynamic> json) =>
      _$GuestModelFromJson(json);
}
