// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_event_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
    r'295833d83f3b1dabde2b62976177541947202e73';

abstract class _$UpdateEventController
    extends $AsyncNotifier<UpdateEventState> {
  FutureOr<UpdateEventState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<UpdateEventState>, UpdateEventState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<UpdateEventState>, UpdateEventState>,
        AsyncValue<UpdateEventState>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
