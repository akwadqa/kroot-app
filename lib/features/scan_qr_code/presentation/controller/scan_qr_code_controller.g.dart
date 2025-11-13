// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_qr_code_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(ScanQrCodeController)
const scanQrCodeControllerProvider = ScanQrCodeControllerProvider._();

final class ScanQrCodeControllerProvider
    extends $AsyncNotifierProvider<ScanQrCodeController, ScanDriverQrState> {
  const ScanQrCodeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scanQrCodeControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scanQrCodeControllerHash();

  @$internal
  @override
  ScanQrCodeController create() => ScanQrCodeController();
}

String _$scanQrCodeControllerHash() =>
    r'90b2c1ffbe07c433539f4ca5285ec7ce5918ec5c';

abstract class _$ScanQrCodeController
    extends $AsyncNotifier<ScanDriverQrState> {
  FutureOr<ScanDriverQrState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<ScanDriverQrState>, ScanDriverQrState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ScanDriverQrState>, ScanDriverQrState>,
              AsyncValue<ScanDriverQrState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
