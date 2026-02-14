// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(AppController)
const appControllerProvider = AppControllerProvider._();

final class AppControllerProvider
    extends $AsyncNotifierProvider<AppController, void> {
  const AppControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appControllerHash();

  @$internal
  @override
  AppController create() => AppController();
}

String _$appControllerHash() => r'f365272ce3ed52ea52a189db0d3cf744b3d865fd';

abstract class _$AppController extends $AsyncNotifier<void> {
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
