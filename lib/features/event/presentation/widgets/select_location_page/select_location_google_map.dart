import 'dart:async';

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
    ref.listen(addEventControllerProvider, (previous, next) async {
      if (next?.value == null) return;

      final latLng = next!.value!.latLng;
      final controller = await mapController.future;

      controller.animateCamera(
        google.CameraUpdate.newLatLng(google.LatLng(latLng.lat, latLng.lng)),
      );
    });

    final lat = id == null
        ? ref.watch(addEventControllerProvider).value!.latLng.lat
        : ref
              .watch(updateEventControllerProvider)
              .value!
              .updatedEvent!
              .mapLatitude!;
    final lng = id == null
        ? ref.watch(addEventControllerProvider).value!.latLng.lng
        : ref
              .watch(updateEventControllerProvider)
              .value!
              .updatedEvent!
              .mapLongitude!;
    LatLng lanlng = LatLng(
      lat: double.parse(lat.toString()),
      lng: double.parse(lng.toString()),
    );
    // LatLng lanlng = id == null
    //     ? ref.watch(addEventControllerProvider).value!.latLng
    //     : ref.watch(
    //         updateEventControllerProvider.select((val) {
    //           final lat = val.value!.updatedEvent!.mapLatitude;
    //           final lng = val.value!.updatedEvent!.mapLongitude;
    //           return LatLng(lat: double.parse(lat!), lng: double.parse(lng!));
    //         }),
    //       );
    final qatarLocation = google.CameraPosition(
      target: google.LatLng(lanlng.lat, lanlng.lng),
      zoom: 14.4746,
    );
    return google.GoogleMap(
      myLocationEnabled: false,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
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
          markerId: google.MarkerId('value'),
          position: google.LatLng(lanlng.lat, lanlng.lng),
        ),
      },
      initialCameraPosition: qatarLocation,
      onMapCreated: (controller) {
        mapController.complete(controller);
      },
    );
  }
}
