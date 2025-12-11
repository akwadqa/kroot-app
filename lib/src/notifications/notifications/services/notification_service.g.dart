// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// Riverpod provider for NotificationsService
@ProviderFor(notificationsService)
const notificationsServiceProvider = NotificationsServiceProvider._();

/// Riverpod provider for NotificationsService
final class NotificationsServiceProvider
    extends
        $FunctionalProvider<
          NotificationsService,
          NotificationsService,
          NotificationsService
        >
    with $Provider<NotificationsService> {
  /// Riverpod provider for NotificationsService
  const NotificationsServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationsServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationsServiceHash();

  @$internal
  @override
  $ProviderElement<NotificationsService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NotificationsService create(Ref ref) {
    return notificationsService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationsService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationsService>(value),
    );
  }
}

String _$notificationsServiceHash() =>
    r'1210ccb08dd4d5c8d2554af87f4ed41ee14ed8e5';

/// Controller to send device token to backend
@ProviderFor(DeviceTokenController)
const deviceTokenControllerProvider = DeviceTokenControllerProvider._();

/// Controller to send device token to backend
final class DeviceTokenControllerProvider
    extends $AsyncNotifierProvider<DeviceTokenController, void> {
  /// Controller to send device token to backend
  const DeviceTokenControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceTokenControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceTokenControllerHash();

  @$internal
  @override
  DeviceTokenController create() => DeviceTokenController();
}

String _$deviceTokenControllerHash() =>
    r'248339f0b48dae2382cd1e27e3ebbbbe1c95e6db';

abstract class _$DeviceTokenController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
