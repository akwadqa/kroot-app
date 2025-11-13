import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_qr_response.freezed.dart';
part 'scan_qr_response.g.dart';

@freezed
abstract class ScanQrResponse with _$ScanQrResponse {
  const factory ScanQrResponse({
    /// JSON key: "invitee"
    required String invitee,

    /// JSON key: "occasion"
    required String occasion,

    /// JSON key: "checked_in" -> camelCase: checkedIn
    @JsonKey(name: 'checked_in') required int checkedIn,

    /// JSON key: "party_size" -> camelCase: partySize
    @JsonKey(name: 'party_size') required int partySize,
  }) = _ScanQrResponse;

  factory ScanQrResponse.fromJson(Map<String, dynamic> json) =>
      _$ScanQrResponseFromJson(json);
}
