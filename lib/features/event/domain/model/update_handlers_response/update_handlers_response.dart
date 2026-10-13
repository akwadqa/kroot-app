import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';

part 'update_handlers_response.freezed.dart';
part 'update_handlers_response.g.dart';

@freezed
abstract class UpdateHandlersResponse with _$UpdateHandlersResponse {
  const factory UpdateHandlersResponse({
     List<HandlerModel>? added,
     List<String>? duplicates,
     List<String>? handlers,
  }) = _UpdateHandlersResponse;

  factory UpdateHandlersResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateHandlersResponseFromJson(json);
}
