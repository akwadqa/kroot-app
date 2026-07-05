// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CardsController)
const cardsControllerProvider = CardsControllerProvider._();

final class CardsControllerProvider
    extends $AsyncNotifierProvider<CardsController, CardsState> {
  const CardsControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'cardsControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$cardsControllerHash();

  @$internal
  @override
  CardsController create() => CardsController();
}

String _$cardsControllerHash() => r'af89a0009adacce101079ae8283045fb61a89866';

abstract class _$CardsController extends $AsyncNotifier<CardsState> {
  FutureOr<CardsState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<CardsState>, CardsState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<CardsState>, CardsState>,
        AsyncValue<CardsState>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
