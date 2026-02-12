// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(AppService)
const appServiceProvider = AppServiceProvider._();

final class AppServiceProvider extends $NotifierProvider<AppService, void> {
  const AppServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appServiceHash();

  @$internal
  @override
  AppService create() => AppService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$appServiceHash() => r'bdf4f33caf0e5736eac720f719eaa04d793f7a5c';

abstract class _$AppService extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
