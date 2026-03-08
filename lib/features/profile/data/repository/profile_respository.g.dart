// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_respository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(profileRespository)
const profileRespositoryProvider = ProfileRespositoryProvider._();

final class ProfileRespositoryProvider extends $FunctionalProvider<
    ProfileRespository,
    ProfileRespository,
    ProfileRespository> with $Provider<ProfileRespository> {
  const ProfileRespositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'profileRespositoryProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$profileRespositoryHash();

  @$internal
  @override
  $ProviderElement<ProfileRespository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ProfileRespository create(Ref ref) {
    return profileRespository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileRespository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileRespository>(value),
    );
  }
}

String _$profileRespositoryHash() =>
    r'cd17f79032927aac016a518e6ec3c2c969baed6f';
