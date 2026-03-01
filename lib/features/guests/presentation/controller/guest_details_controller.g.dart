// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_details_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(GuestDetailsController)
const guestDetailsControllerProvider = GuestDetailsControllerFamily._();

final class GuestDetailsControllerProvider
    extends $AsyncNotifierProvider<GuestDetailsController, GuestModel> {
  const GuestDetailsControllerProvider._({
    required GuestDetailsControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'guestDetailsControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$guestDetailsControllerHash();

  @override
  String toString() {
    return r'guestDetailsControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  GuestDetailsController create() => GuestDetailsController();

  @override
  bool operator ==(Object other) {
    return other is GuestDetailsControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$guestDetailsControllerHash() =>
    r'2d620b6ab143e9ee68f82d2a5bfbabd74105fdf7';

final class GuestDetailsControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          GuestDetailsController,
          AsyncValue<GuestModel>,
          GuestModel,
          FutureOr<GuestModel>,
          String
        > {
  const GuestDetailsControllerFamily._()
    : super(
        retry: null,
        name: r'guestDetailsControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GuestDetailsControllerProvider call(String id) =>
      GuestDetailsControllerProvider._(argument: id, from: this);

  @override
  String toString() => r'guestDetailsControllerProvider';
}

abstract class _$GuestDetailsController extends $AsyncNotifier<GuestModel> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  FutureOr<GuestModel> build(String id);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<GuestModel>, GuestModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<GuestModel>, GuestModel>,
              AsyncValue<GuestModel>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
