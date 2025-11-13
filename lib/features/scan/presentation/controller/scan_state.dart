// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:wedding_app/features/scan/data/model/scan_qr_response/scan_qr_response.dart';

class ScanState {
  final ScanQrResponse? scanQrResponse;

  ScanState({required this.scanQrResponse});

  factory ScanState.init() => ScanState(scanQrResponse: null);

  ScanState copyWith({ScanQrResponse? scanQrResponse}) {
    return ScanState(scanQrResponse: scanQrResponse ?? this.scanQrResponse);
  }
}
