part of 'scan_driver_qr_repository.dart';

@ProviderFor(scanDriverQrRepository)
const scanDriverQrRepositoryProvider = ScanDriverQrRepositoryProvider._();

final class ScanDriverQrRepositoryProvider
    extends
        $FunctionalProvider<
          ScanDriverQrRepository,
          ScanDriverQrRepository,
          ScanDriverQrRepository
        >
    with $Provider<ScanDriverQrRepository> {
  const ScanDriverQrRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scanDriverQrRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scanDriverQrRepositoryHash();

  @$internal
  @override
  $ProviderElement<ScanDriverQrRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ScanDriverQrRepository create(Ref ref) {
    return scanDriverQrRepository(ref);
  }

  Override overrideWithValue(ScanDriverQrRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScanDriverQrRepository>(value),
    );
  }
}

String _$scanDriverQrRepositoryHash() =>
    r'87f60017fd8dfa0e6887465d704a959d752193c6';
