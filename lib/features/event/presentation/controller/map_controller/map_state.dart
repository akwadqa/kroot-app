import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MapState {
  final LatLng latLng;
  final LatLng? initialLatLng;
  final AsyncValue<List<AutocompletePrediction>>? predictions;
  final AsyncValue<SelectedPlace>? selectedPlace;

  MapState({
    required this.latLng,
    required this.initialLatLng,
    required this.predictions,
    required this.selectedPlace,
  });

  factory MapState.init() => MapState(
        latLng: LatLng(lat: 25.2854473, lng: 51.53103979999999),
        initialLatLng: null,
        predictions: null,
        selectedPlace: null,
      );

  MapState copyWith({
    LatLng? latLng,
    LatLng? initialLatLng,
    AsyncValue<List<AutocompletePrediction>>? predictions,
    AsyncValue<SelectedPlace>? selectedPlace,
  }) {
    return MapState(
      latLng: latLng ?? this.latLng,
      initialLatLng: initialLatLng ?? this.initialLatLng,
      predictions: predictions ?? this.predictions,
      selectedPlace: selectedPlace ?? this.selectedPlace,
    );
  }
}

class SelectedPlace {
  final String placeId;
  final String mapLink;
  final String locationName;
  final double lat;
  final double lng;

  SelectedPlace({
    required this.placeId,
    required this.mapLink,
    required this.locationName,
    required this.lat,
    required this.lng,
  });
}

class CurrentLocation {
  final double lat;
  final double lng;
  final String locationName;

  CurrentLocation({
    required this.lat,
    required this.lng,
    required this.locationName,
  });

  factory CurrentLocation.doha() => CurrentLocation(
        lat: 25.2854473,
        lng: 51.53103979999999,
        locationName: 'Doha, Qatar',
      );
}
