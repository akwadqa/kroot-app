// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guests_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$guestsControllerHash() => r'6bc2e6020782007631a983380364f9187c84f765';

abstract class _$GuestsController extends $AsyncNotifier<GuestsState> {
  FutureOr<GuestsState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<GuestsState>, GuestsState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<GuestsState>, GuestsState>,
        AsyncValue<GuestsState>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
