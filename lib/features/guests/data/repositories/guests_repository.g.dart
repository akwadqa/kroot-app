// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guests_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(guestsRepository)
const guestsRepositoryProvider = GuestsRepositoryProvider._();

final class GuestsRepositoryProvider
    extends
        $FunctionalProvider<
          GuestsRepository,
          GuestsRepository,
          GuestsRepository
        >
    with $Provider<GuestsRepository> {
  const GuestsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'guestsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$guestsRepositoryHash();

  @$internal
  @override
  $ProviderElement<GuestsRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GuestsRepository create(Ref ref) {
    return guestsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GuestsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GuestsRepository>(value),
    );
  }
}

String _$guestsRepositoryHash() => r'32db35441167d3ba7760a90a76e2cac474b1cc9b';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
