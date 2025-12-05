import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google;
import 'package:kroot_app/features/event/presentation/controller/add_event/add_event_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/update_event/update_event_controller.dart';

class SelectLocationGoogleMap extends ConsumerWidget {
  const SelectLocationGoogleMap(this.mapController, this.id, {super.key});
  final String? id;
  final Completer<google.GoogleMapController> mapController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LatLng lanlng = id == null
        ? ref.watch(addEventControllerProvider).value!.latLng
        : ref.watch(
            updateEventControllerProvider.select((val) {
              final lat = val.value!.updatedEvent!.mapLatitude;
              final lng = val.value!.updatedEvent!.mapLongitude;
              return LatLng(lat: double.parse(lat!), lng: double.parse(lng!));
            }),
          );
    final qatarLocation = google.CameraPosition(
      // target: LatLng(25.2854473, 51.53103979999999),
      target: google.LatLng(lanlng.lat, lanlng.lng),
      zoom: 14.4746,
    );
    return google.GoogleMap(
      onTap: (position) {
        id == null
            ? ref
                  .read(addEventControllerProvider.notifier)
                  .changeLatlng(position.latitude, position.longitude)
            : ref
                  .read(updateEventControllerProvider.notifier)
                  .changeLatlng(position.latitude, position.longitude);
      },
      markers: {
         google.Marker(
          markerId:  google.MarkerId('value'),
          position:  google.LatLng(lanlng.lat, lanlng.lng),
        ),
      },
      initialCameraPosition: qatarLocation,
      onMapCreated: (controller) {
        mapController.complete(controller);
      },
    );
  }
}
