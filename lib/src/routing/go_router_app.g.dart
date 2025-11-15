// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'go_router_app.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(goRouter)
const goRouterProvider = GoRouterProvider._();

final class GoRouterProvider
    extends $FunctionalProvider<GoRouterApp, GoRouterApp, GoRouterApp>
    with $Provider<GoRouterApp> {
  const GoRouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'goRouterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$goRouterHash();

  @$internal
  @override
  $ProviderElement<GoRouterApp> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouterApp create(Ref ref) {
    return goRouter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouterApp value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouterApp>(value),
    );
  }
}

String _$goRouterHash() => r'3b551ea229dcafd41769fcb02da0b6af2be08f24';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
