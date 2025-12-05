// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_event_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(AddEventController)
const addEventControllerProvider = AddEventControllerProvider._();

final class AddEventControllerProvider
    extends $AsyncNotifierProvider<AddEventController, AddEventState> {
  const AddEventControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addEventControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addEventControllerHash();

  @$internal
  @override
  AddEventController create() => AddEventController();
}

String _$addEventControllerHash() =>
    r'a475dbd1d45586d111d0d381d4b8cdae68ffe4ae';

abstract class _$AddEventController extends $AsyncNotifier<AddEventState> {
  FutureOr<AddEventState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<AddEventState>, AddEventState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AddEventState>, AddEventState>,
              AsyncValue<AddEventState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
