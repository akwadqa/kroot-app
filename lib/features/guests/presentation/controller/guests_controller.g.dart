// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guests_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(GuestsController)
const guestsControllerProvider = GuestsControllerProvider._();

final class GuestsControllerProvider
    extends $AsyncNotifierProvider<GuestsController, List<GuestModel>> {
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

String _$guestsControllerHash() => r'843de9662bbdca13fee25e174489bdf0b6d9828d';

abstract class _$GuestsController extends $AsyncNotifier<List<GuestModel>> {
  FutureOr<List<GuestModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<GuestModel>>, List<GuestModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<GuestModel>>, List<GuestModel>>,
              AsyncValue<List<GuestModel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
