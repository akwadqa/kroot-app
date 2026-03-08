// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sharedPreferences)
const sharedPreferencesProvider = SharedPreferencesProvider._();

final class SharedPreferencesProvider extends $FunctionalProvider<
        AsyncValue<SharedPreferences>,
        SharedPreferences,
        FutureOr<SharedPreferences>>
    with
        $FutureModifier<SharedPreferences>,
        $FutureProvider<SharedPreferences> {
  const SharedPreferencesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'sharedPreferencesProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferencesHash();

  @$internal
  @override
  $FutureProviderElement<SharedPreferences> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<SharedPreferences> create(Ref ref) {
    return sharedPreferences(ref);
  }
}

String _$sharedPreferencesHash() => r'ca329d21cb9532acf76436fc839fde21c0b7f1e6';

@ProviderFor(UserData)
const userDataProvider = UserDataProvider._();

final class UserDataProvider extends $NotifierProvider<UserData, UserSession?> {
  const UserDataProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userDataProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userDataHash();

  @$internal
  @override
  UserData create() => UserData();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserSession? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserSession?>(value),
    );
  }
}

String _$userDataHash() => r'dad91c4f8ae4228096a8f4df2843dafab4249b16';

abstract class _$UserData extends $Notifier<UserSession?> {
  UserSession? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<UserSession?, UserSession?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<UserSession?, UserSession?>,
        UserSession?,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(isAuthinticated)
const isAuthinticatedProvider = IsAuthinticatedProvider._();

final class IsAuthinticatedProvider
    extends $FunctionalProvider<bool, bool, bool> with $Provider<bool> {
  const IsAuthinticatedProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'isAuthinticatedProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$isAuthinticatedHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isAuthinticated(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isAuthinticatedHash() => r'06718e95e3ceea2ea9b79d792cbdee9e9cc4164c';
