// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_ui_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(HomeUiController)
const homeUiControllerProvider = HomeUiControllerProvider._();

final class HomeUiControllerProvider
    extends $NotifierProvider<HomeUiController, HomeUiState> {
  const HomeUiControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeUiControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeUiControllerHash();

  @$internal
  @override
  HomeUiController create() => HomeUiController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeUiState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeUiState>(value),
    );
  }
}

String _$homeUiControllerHash() => r'ba51dd7960b5ba6ea28d55268b3aaae2bb47ca28';

abstract class _$HomeUiController extends $Notifier<HomeUiState> {
  HomeUiState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<HomeUiState, HomeUiState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<HomeUiState, HomeUiState>,
              HomeUiState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
