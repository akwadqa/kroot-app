// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:wedding_app/features/scan/data/model/scan_qr_response/scan_qr_response.dart';
import 'package:wedding_app/features/scan/data/model/user_scan_event_response/user_scan_event_response.dart';

class ScanState {
  final ScanQrResponse? scanQrResponse;
  final UserScanEventResponse? userScanEventResponse;

  ScanState({
    required this.scanQrResponse,
    required this.userScanEventResponse,
  });

  factory ScanState.init() =>
      ScanState(scanQrResponse: null, userScanEventResponse: null);

  ScanState copyWith({
    ScanQrResponse? scanQrResponse,
    UserScanEventResponse? userScanEventResponse,
  }) {
    return ScanState(
      scanQrResponse: scanQrResponse ?? this.scanQrResponse,
      userScanEventResponse:
          userScanEventResponse ?? this.userScanEventResponse,
    );
  }
}
