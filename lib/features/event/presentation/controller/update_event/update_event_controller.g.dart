// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_event_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(UpdateEventController)
const updateEventControllerProvider = UpdateEventControllerProvider._();

final class UpdateEventControllerProvider
    extends $AsyncNotifierProvider<UpdateEventController, UpdateEventState> {
  const UpdateEventControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateEventControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateEventControllerHash();

  @$internal
  @override
  UpdateEventController create() => UpdateEventController();
}

String _$updateEventControllerHash() =>
    r'58281b4b444baeb41788afe5bf0682fbcf2ee79f';

abstract class _$UpdateEventController
    extends $AsyncNotifier<UpdateEventState> {
  FutureOr<UpdateEventState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<UpdateEventState>, UpdateEventState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UpdateEventState>, UpdateEventState>,
              AsyncValue<UpdateEventState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
