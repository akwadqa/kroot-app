// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NotificationController)
const notificationControllerProvider = NotificationControllerFamily._();

final class NotificationControllerProvider extends $StreamNotifierProvider<
    NotificationController, List<NotificationModel>> {
  const NotificationControllerProvider._(
      {required NotificationControllerFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'notificationControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$notificationControllerHash();

  @override
  String toString() {
    return r'notificationControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  NotificationController create() => NotificationController();

  @override
  bool operator ==(Object other) {
    return other is NotificationControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$notificationControllerHash() =>
    r'db201e98f21dce0581b96ed469044c7f4fcd2f35';

final class NotificationControllerFamily extends $Family
    with
        $ClassFamilyOverride<
            NotificationController,
            AsyncValue<List<NotificationModel>>,
            List<NotificationModel>,
            Stream<List<NotificationModel>>?,
            String> {
  const NotificationControllerFamily._()
      : super(
          retry: null,
          name: r'notificationControllerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  NotificationControllerProvider call(
    String userId,
  ) =>
      NotificationControllerProvider._(argument: userId, from: this);

  @override
  String toString() => r'notificationControllerProvider';
}

abstract class _$NotificationController
    extends $StreamNotifier<List<NotificationModel>> {
  late final _$args = ref.$arg as String;
  String get userId => _$args;

  Stream<List<NotificationModel>>? build(
    String userId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref
        as $Ref<AsyncValue<List<NotificationModel>>, List<NotificationModel>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<NotificationModel>>,
            List<NotificationModel>>,
        AsyncValue<List<NotificationModel>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
