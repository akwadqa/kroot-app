// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_ui_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GuestUiController)
const guestUiControllerProvider = GuestUiControllerProvider._();

final class GuestUiControllerProvider
    extends $NotifierProvider<GuestUiController, GuestUiState> {
  const GuestUiControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'guestUiControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$guestUiControllerHash();

  @$internal
  @override
  GuestUiController create() => GuestUiController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GuestUiState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GuestUiState>(value),
    );
  }
}

String _$guestUiControllerHash() => r'507204ea2e32212710dd59be38b0bb32db6ead65';

abstract class _$GuestUiController extends $Notifier<GuestUiState> {
  GuestUiState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<GuestUiState, GuestUiState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<GuestUiState, GuestUiState>,
        GuestUiState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
