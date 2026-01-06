part of 'add_event_controller.dart';

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
    r'94824b50dca635bbc2204ee809a6a779d8507a6e';

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
