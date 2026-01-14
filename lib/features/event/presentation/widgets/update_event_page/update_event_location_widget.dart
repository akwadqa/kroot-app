import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kroot_app/src/routing/routes.dart';

class UpdateEventLocationWidget extends StatelessWidget {
  final String? id;
  const UpdateEventLocationWidget({super.key, required this.latlng, this.id});

  final LatLng latlng;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: SizedBox(
        width: double.infinity,
        height: 194.h,
        child: GoogleMap(
          onTap: (_) => context.push(Routes.selectLocation, extra: id),
          scrollGesturesEnabled: false,
          markers: {
            Marker(
              markerId: MarkerId('${latlng.latitude} ${latlng.longitude}'),
              // position: LatLng(latlng.lat, latlng.lng),
              position: latlng,
            ),
          },
          initialCameraPosition: CameraPosition(
            // target: LatLng(latlng.lat, latlng.lng),
            target: latlng,
            zoom: 14,
          ),
        ),
      ),
    );
  }
}
