part of 'auth_controller.dart';

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

String _$authControllerHash() => r'ee4231e893b4acc73510f6d18eca48e35f726b87';

abstract class _$AuthController extends $AsyncNotifier<AuthControllerState?> {
  FutureOr<AuthControllerState?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<AuthControllerState?>, AuthControllerState?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<AuthControllerState?>,
                AuthControllerState?
              >,
              AsyncValue<AuthControllerState?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
