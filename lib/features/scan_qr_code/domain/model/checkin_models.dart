import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkin_models.freezed.dart';
part 'checkin_models.g.dart';

int? _checkedInToInt(dynamic v) {
  if (v == null) return null;
  if (v is bool) return v ? 1 : 0;
  if (v is num) return v.toInt();
  return int.tryParse(v.toString());
}

@freezed
abstract class CheckinItem with _$CheckinItem {
  const factory CheckinItem({
    String? invitee,
    String? occasion,
    @JsonKey(name: 'checked_in', fromJson: _checkedInToInt) int? checkedIn,
    @JsonKey(name: 'party_size') int? partySize,
  }) = _CheckinItem;

  factory CheckinItem.fromJson(Map<String, dynamic> json) =>
      _$CheckinItemFromJson(json);
}

@freezed
abstract class CheckinPayload with _$CheckinPayload {
  const factory CheckinPayload({
    @Default(<CheckinItem>[]) List<CheckinItem> items,
  }) = _CheckinPayload;

  factory CheckinPayload.fromJson(Map<String, dynamic> json) =>
      _$CheckinPayloadFromJson(json);

  static CheckinPayload fromAny(Object? json) {
    if (json is List) {
      return CheckinPayload(
        items: json
            .whereType<Map>()
            .map((e) => CheckinItem.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );
    }
    if (json is Map) {
      return CheckinPayload(
        items: [CheckinItem.fromJson(Map<String, dynamic>.from(json))],
      );
    }
    return const CheckinPayload();
  }
}
