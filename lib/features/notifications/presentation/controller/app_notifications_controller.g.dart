// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_notifications_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppNotificationsController)
const appNotificationsControllerProvider =
    AppNotificationsControllerProvider._();

final class AppNotificationsControllerProvider extends $AsyncNotifierProvider<
    AppNotificationsController, List<AppNotificationsModel>> {
  const AppNotificationsControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'appNotificationsControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$appNotificationsControllerHash();

  @$internal
  @override
  AppNotificationsController create() => AppNotificationsController();
}

String _$appNotificationsControllerHash() =>
    r'e30e9671c9620b1913fb72a0d2c8fd80fb3cb6dd';

abstract class _$AppNotificationsController
    extends $AsyncNotifier<List<AppNotificationsModel>> {
  FutureOr<List<AppNotificationsModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<AppNotificationsModel>>,
        List<AppNotificationsModel>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<AppNotificationsModel>>,
            List<AppNotificationsModel>>,
        AsyncValue<List<AppNotificationsModel>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
