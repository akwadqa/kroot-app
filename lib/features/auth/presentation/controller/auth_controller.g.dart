// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthController)
const authControllerProvider = AuthControllerProvider._();

final class AuthControllerProvider
    extends $AsyncNotifierProvider<AuthController, AuthControllerState?> {
  const AuthControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'authControllerProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$authControllerHash();

  @$internal
  @override
  AuthController create() => AuthController();
}

String _$authControllerHash() => r'c28f7c4ca30e1b802cb0aed61b299cc7498ad397';

abstract class _$AuthController extends $AsyncNotifier<AuthControllerState?> {
  FutureOr<AuthControllerState?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref
        as $Ref<AsyncValue<AuthControllerState?>, AuthControllerState?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<AuthControllerState?>, AuthControllerState?>,
        AsyncValue<AuthControllerState?>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
