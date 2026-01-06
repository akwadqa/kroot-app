// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_respository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(scanRepository)
const scanRepositoryProvider = ScanRepositoryProvider._();

final class ScanRepositoryProvider
    extends
        $FunctionalProvider<ScanRespository, ScanRespository, ScanRespository>
    with $Provider<ScanRespository> {
  const ScanRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scanRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scanRepositoryHash();

  @$internal
  @override
  $ProviderElement<ScanRespository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ScanRespository create(Ref ref) {
    return scanRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScanRespository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScanRespository>(value),
    );
  }
}

String _$scanRepositoryHash() => r'9ba455480454325111cce2222efc87f0df45fed2';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
