// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_ui_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthUiController)
const authUiControllerProvider = AuthUiControllerProvider._();

final class AuthUiControllerProvider
    extends $NotifierProvider<AuthUiController, AuthUiState> {
  const AuthUiControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'authUiControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$authUiControllerHash();

  @$internal
  @override
  AuthUiController create() => AuthUiController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthUiState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthUiState>(value),
    );
  }
}

String _$authUiControllerHash() => r'9a9750588f0602748dab430cde2197f139e05c7e';

abstract class _$AuthUiController extends $Notifier<AuthUiState> {
  AuthUiState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AuthUiState, AuthUiState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AuthUiState, AuthUiState>, AuthUiState, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
