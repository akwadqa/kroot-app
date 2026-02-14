// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(appDataRepository)
const appDataRepositoryProvider = AppDataRepositoryProvider._();

final class AppDataRepositoryProvider
    extends
        $FunctionalProvider<
          AppDataRepository,
          AppDataRepository,
          AppDataRepository
        >
    with $Provider<AppDataRepository> {
  const AppDataRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appDataRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appDataRepositoryHash();

  @$internal
  @override
  $ProviderElement<AppDataRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AppDataRepository create(Ref ref) {
    return appDataRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDataRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDataRepository>(value),
    );
  }
}

String _$appDataRepositoryHash() => r'fdab8a5cb8ba7a84be9cd04260be87de9bba9ae0';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
