// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_repositories.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(homeRepository)
const homeRepositoryProvider = HomeRepositoryProvider._();

final class HomeRepositoryProvider extends $FunctionalProvider<HomeRepositories,
    HomeRepositories, HomeRepositories> with $Provider<HomeRepositories> {
  const HomeRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'homeRepositoryProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$homeRepositoryHash();

  @$internal
  @override
  $ProviderElement<HomeRepositories> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HomeRepositories create(Ref ref) {
    return homeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeRepositories value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeRepositories>(value),
    );
  }
}

String _$homeRepositoryHash() => r'ede126b65dec5a3b3d8c2c8fcca8189d8d800008';
