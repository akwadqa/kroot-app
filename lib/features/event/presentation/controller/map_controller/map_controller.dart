import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kroot_app/features/event/presentation/controller/map_controller/map_state.dart';

part 'map_controller.g.dart';

final placesSdkProvider = Provider<FlutterGooglePlacesSdk>((ref) {
  return FlutterGooglePlacesSdk(dotenv.env['MAPS_API_KEY']!);
});

/// Device location + its geocoded name.
/// Fetched once (permission, GPS, geocode) and cached for the app lifetime.
@Riverpod(keepAlive: true)
Future<CurrentLocation> currentLocation(Ref ref) async {
  try {
    final permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return CurrentLocation.doha();
    }

    final pos = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );

    final response = await Dio().get(
      "https://maps.googleapis.com/maps/api/geocode/json"
      "?latlng=${pos.latitude},${pos.longitude}&key=${dotenv.env['MAPS_API_KEY']}",
    );

    String locationName = "Current Location";
    if (response.statusCode == 200 && response.data["status"] == "OK") {
      locationName = response.data["results"][0]["formatted_address"];
    }

    return CurrentLocation(
      lat: pos.latitude,
      lng: pos.longitude,
      locationName: locationName,
    );
  } catch (_) {
    return CurrentLocation.doha();
  }
}

/// Map & location state for one event flow.
/// [eventId] == null -> create flow, otherwise -> update flow of that event.
@riverpod
class MapController extends _$MapController {
  @override
  FutureOr<MapState> build(String? eventId) {
    return MapState.init();
  }

  String _mapLink(double lat, double lng) =>
      "https://www.google.com/maps/search/?api=1&query=$lat,$lng";

  /// Create flow: uses the cached device location (no repeated API calls).
  /// Does nothing if a place has already been set for this flow.
  Future<void> useCurrentLocation() async {
    if (state.value!.selectedPlace != null) return;

    final isCached = ref.read(currentLocationProvider).hasValue;
    if (!isCached) {
      state = AsyncData(state.value!.copyWith(selectedPlace: AsyncLoading()));
    }

    final location = await ref.read(currentLocationProvider.future);
    final latLng = LatLng(lat: location.lat, lng: location.lng);

    state = AsyncData(
      state.value!.copyWith(
        latLng: latLng,
        initialLatLng: latLng,
        selectedPlace: AsyncData(
          SelectedPlace(
            placeId: "",
            mapLink: _mapLink(location.lat, location.lng),
            locationName: location.locationName,
            lat: location.lat,
            lng: location.lng,
          ),
        ),
      ),
    );
  }

  /// Update flow: seeds the map from the event's saved location.
  void setFromEvent({
    required String? lat,
    required String? lng,
    required String? locationName,
  }) {
    final parsedLat = double.tryParse(lat ?? '');
    final parsedLng = double.tryParse(lng ?? '');
    final cached = ref.read(currentLocationProvider).value;

    final latLng = parsedLat != null && parsedLng != null
        ? LatLng(lat: parsedLat, lng: parsedLng)
        : state.value!.latLng;

    state = AsyncData(
      MapState.init().copyWith(
        latLng: latLng,
        initialLatLng:
            cached != null ? LatLng(lat: cached.lat, lng: cached.lng) : latLng,
        selectedPlace: AsyncData(
          SelectedPlace(
            placeId: "",
            mapLink: _mapLink(latLng.lat, latLng.lng),
            locationName: locationName ?? '',
            lat: latLng.lat,
            lng: latLng.lng,
          ),
        ),
      ),
    );
  }

  Future<void> searchForLocation(String query) async {
    final sdk = ref.read(placesSdkProvider);
    if (query.isEmpty) {
      state = AsyncData(state.value!.copyWith(predictions: AsyncData([])));
      return;
    }

    state = AsyncData(state.value!.copyWith(predictions: AsyncLoading()));

    final result = await sdk.findAutocompletePredictions(query);

    state = AsyncData(
      state.value!.copyWith(predictions: AsyncData(result.predictions)),
    );
  }

  void clearSearchSuggestions() {
    state = AsyncData(state.value!.copyWith(predictions: AsyncData([])));
  }

  Future<LatLng?> getPlaceLocation(String placeId) async {
    final sdk = ref.read(placesSdkProvider);
    final result = await sdk.fetchPlace(placeId, fields: [PlaceField.Location]);

    final loc = result.place?.latLng;
    if (loc == null) return null;

    changeLatlng(loc.lat, loc.lng);
    return LatLng(lat: loc.lat, lng: loc.lng);
  }

  void changeLatlng(double lat, double lng) {
    state = AsyncData(
      state.value!.copyWith(latLng: LatLng(lat: lat, lng: lng)),
    );
  }

  /// Resets the map position to the device location.
  void moveToInitialLocation() {
    final initial = state.value!.initialLatLng;
    if (initial == null) return;
    changeLatlng(initial.lat, initial.lng);
  }

  Future<void> getPlaceInfoFromLatLng() async {
    final lat = state.value!.latLng.lat;
    final lng = state.value!.latLng.lng;
    try {
      state = AsyncData(state.value!.copyWith(selectedPlace: AsyncLoading()));
      final apiKey = dotenv.env['MAPS_API_KEY'];
      if (apiKey == null) throw Exception('Missing MAPS_API_KEY');

      final response = await Dio().get(
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$apiKey",
      );

      final data = response.data;
      if (response.statusCode != 200 || data["status"] != "OK") {
        throw Exception(data?["status"] ?? 'Geocode failed');
      }

      final result = data["results"][0];

      state = AsyncData(
        state.value!.copyWith(
          selectedPlace: AsyncData(
            SelectedPlace(
              placeId: result["place_id"] ?? "",
              mapLink: _mapLink(lat, lng),
              locationName: cleanName(result["formatted_address"] ?? ""),
              lat: lat,
              lng: lng,
            ),
          ),
        ),
      );
    } catch (e, st) {
      state = AsyncData(
        state.value!.copyWith(selectedPlace: AsyncError(e, st)),
      );
    }
  }

  String cleanName(String address) {
    if (address.isEmpty) return "Location";

    final trimmed = address.trim();

    List<String> commaParts = trimmed.split(',').map((e) => e.trim()).toList();

    String first = commaParts[0];

    final fullPlusCode = RegExp(r"^[A-Z0-9]{4,}\+[A-Z0-9]+");
    first = first.replaceFirst(fullPlusCode, '').trim();

    final shortPlusCode = RegExp(r"^\+[A-Z0-9]{2,4}");
    first = first.replaceFirst(shortPlusCode, '').trim();

    List<String> parts = [];
    if (first.isNotEmpty) {
      parts.add(first);
    }

    if (commaParts.length > 1) {
      parts.addAll(commaParts.sublist(1));
    }

    final result = parts.join(', ').trim();

    if (RegExp(r"^[0-9+\- ]+$").hasMatch(result)) {
      return "Location";
    }

    return result.isEmpty ? "Location" : result;
  }
}
