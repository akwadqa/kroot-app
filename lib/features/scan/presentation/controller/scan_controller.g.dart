// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ScanController)
const scanControllerProvider = ScanControllerProvider._();

final class ScanControllerProvider
    extends $AsyncNotifierProvider<ScanController, ScanState> {
  const ScanControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'scanControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$scanControllerHash();

  @$internal
  @override
  ScanController create() => ScanController();
}

String _$scanControllerHash() => r'7c3923c5742f534301fe6d906392a5b70988d88d';

abstract class _$ScanController extends $AsyncNotifier<ScanState> {
  FutureOr<ScanState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<ScanState>, ScanState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<ScanState>, ScanState>,
        AsyncValue<ScanState>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
