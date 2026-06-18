// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cardsRepository)
const cardsRepositoryProvider = CardsRepositoryProvider._();

final class CardsRepositoryProvider extends $FunctionalProvider<CardsRepository,
    CardsRepository, CardsRepository> with $Provider<CardsRepository> {
  const CardsRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'cardsRepositoryProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$cardsRepositoryHash();

  @$internal
  @override
  $ProviderElement<CardsRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CardsRepository create(Ref ref) {
    return cardsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CardsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CardsRepository>(value),
    );
  }
}

String _$cardsRepositoryHash() => r'69022c1d29104ffe208c275380f5a559e64ab199';
