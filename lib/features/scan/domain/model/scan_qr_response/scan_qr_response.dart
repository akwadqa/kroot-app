import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_qr_response.freezed.dart';
part 'scan_qr_response.g.dart';

@freezed
abstract class ScanQrResponse with _$ScanQrResponse {
  const factory ScanQrResponse({
    required String invitee,

    required String occasion,

    @JsonKey(name: 'checked_in') required int checkedIn,

    @JsonKey(name: 'party_size') required int partySize,
  }) = _ScanQrResponse;

  factory ScanQrResponse.fromJson(Map<String, dynamic> json) =>
      _$ScanQrResponseFromJson(json);
}
