import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google;
import 'package:kroot_app/features/event/presentation/controller/map_controller/map_controller.dart';

class SelectLocationGoogleMap extends ConsumerWidget {
  const SelectLocationGoogleMap(this.mapController, this.id, {super.key});
  final String? id;
  final Completer<google.GoogleMapController> mapController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      mapControllerProvider(id).select((val) => val.value?.latLng),
      (previous, next) async {
        if (next == null) return;

        final controller = await mapController.future;

        controller.animateCamera(
          google.CameraUpdate.newLatLng(google.LatLng(next.lat, next.lng)),
        );
      },
    );

    final lanlng = ref.watch(
      mapControllerProvider(id).select((val) => val.value!.latLng),
    );
    final qatarLocation = google.CameraPosition(
      target: google.LatLng(lanlng.lat, lanlng.lng),
      zoom: 14.4746,
    );
    return google.GoogleMap(
      myLocationEnabled: false,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      onTap: (position) {
        ref
            .read(mapControllerProvider(id).notifier)
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
