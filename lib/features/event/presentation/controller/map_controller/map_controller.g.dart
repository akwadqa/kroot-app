// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Device location + its geocoded name.
/// Fetched once (permission, GPS, geocode) and cached for the app lifetime.

@ProviderFor(currentLocation)
const currentLocationProvider = CurrentLocationProvider._();

/// Device location + its geocoded name.
/// Fetched once (permission, GPS, geocode) and cached for the app lifetime.

final class CurrentLocationProvider extends $FunctionalProvider<
        AsyncValue<CurrentLocation>, CurrentLocation, FutureOr<CurrentLocation>>
    with $FutureModifier<CurrentLocation>, $FutureProvider<CurrentLocation> {
  /// Device location + its geocoded name.
  /// Fetched once (permission, GPS, geocode) and cached for the app lifetime.
  const CurrentLocationProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'currentLocationProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$currentLocationHash();

  @$internal
  @override
  $FutureProviderElement<CurrentLocation> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<CurrentLocation> create(Ref ref) {
    return currentLocation(ref);
  }
}

String _$currentLocationHash() => r'1f1d10cfe1b88cfa9b7d8625a0ac7cb23a173af6';

/// Map & location state for one event flow.
/// [eventId] == null -> create flow, otherwise -> update flow of that event.

@ProviderFor(MapController)
const mapControllerProvider = MapControllerFamily._();

/// Map & location state for one event flow.
/// [eventId] == null -> create flow, otherwise -> update flow of that event.
final class MapControllerProvider
    extends $AsyncNotifierProvider<MapController, MapState> {
  /// Map & location state for one event flow.
  /// [eventId] == null -> create flow, otherwise -> update flow of that event.
  const MapControllerProvider._(
      {required MapControllerFamily super.from,
      required String? super.argument})
      : super(
          retry: null,
          name: r'mapControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$mapControllerHash();

  @override
  String toString() {
    return r'mapControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MapController create() => MapController();

  @override
  bool operator ==(Object other) {
    return other is MapControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mapControllerHash() => r'27087a410c4784fda86f9d76d7cbfd248639f0fd';

/// Map & location state for one event flow.
/// [eventId] == null -> create flow, otherwise -> update flow of that event.

final class MapControllerFamily extends $Family
    with
        $ClassFamilyOverride<MapController, AsyncValue<MapState>, MapState,
            FutureOr<MapState>, String?> {
  const MapControllerFamily._()
      : super(
          retry: null,
          name: r'mapControllerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// Map & location state for one event flow.
  /// [eventId] == null -> create flow, otherwise -> update flow of that event.

  MapControllerProvider call(
    String? eventId,
  ) =>
      MapControllerProvider._(argument: eventId, from: this);

  @override
  String toString() => r'mapControllerProvider';
}

/// Map & location state for one event flow.
/// [eventId] == null -> create flow, otherwise -> update flow of that event.

abstract class _$MapController extends $AsyncNotifier<MapState> {
  late final _$args = ref.$arg as String?;
  String? get eventId => _$args;

  FutureOr<MapState> build(
    String? eventId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<AsyncValue<MapState>, MapState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<MapState>, MapState>,
        AsyncValue<MapState>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
