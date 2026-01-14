// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_notifications_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(AppNotificationsController)
const appNotificationsControllerProvider =
    AppNotificationsControllerProvider._();

final class AppNotificationsControllerProvider
    extends
        $AsyncNotifierProvider<
          AppNotificationsController,
          List<AppNotificationsModel>
        > {
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
    r'2d85720f3f6f42bc52c2d1526053e140304be7ba';

abstract class _$AppNotificationsController
    extends $AsyncNotifier<List<AppNotificationsModel>> {
  FutureOr<List<AppNotificationsModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<AppNotificationsModel>>,
              List<AppNotificationsModel>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<AppNotificationsModel>>,
                List<AppNotificationsModel>
              >,
              AsyncValue<List<AppNotificationsModel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
