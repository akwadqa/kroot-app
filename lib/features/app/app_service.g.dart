// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$appServiceHash() => r'37a81eebee59f265fabea5a8c601ad9d79e1542f';

abstract class _$AppService extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<void, void>, void, Object?, Object?>;
    element.handleValue(ref, null);
  }
}
