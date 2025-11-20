// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guests_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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

String _$guestsControllerHash() => r'816d7296886ba4fb7bc75b316f5066df8969665f';

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

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
