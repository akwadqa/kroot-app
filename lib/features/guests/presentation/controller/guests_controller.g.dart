part of 'guests_controller.dart';

@ProviderFor(GuestsController)
const guestsControllerProvider = GuestsControllerProvider._();

final class GuestsControllerProvider
    extends $AsyncNotifierProvider<GuestsController, GuestsState> {
  const GuestsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'guestsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$guestsControllerHash();

  @$internal
  @override
  GuestsController create() => GuestsController();
}

String _$guestsControllerHash() => r'6937ddb579cf66ba2551f3d99d3d447ff1c3fd6d';

abstract class _$GuestsController extends $AsyncNotifier<GuestsState> {
  FutureOr<GuestsState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<GuestsState>, GuestsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<GuestsState>, GuestsState>,
              AsyncValue<GuestsState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
