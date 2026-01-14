import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kroot_app/features/event/presentation/controller/add_event/add_event_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/update_event/update_event_controller.dart';
import 'package:kroot_app/features/event/presentation/widgets/select_location_page/location_search_box.dart';
import 'package:kroot_app/features/event/presentation/widgets/select_location_page/select_location_google_map.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/app_toast.dart';

class SelectLocationPage extends ConsumerStatefulWidget {
  final String? id;
  const SelectLocationPage({super.key, required this.id});

  @override
  ConsumerState<SelectLocationPage> createState() => _SelectLocationPageState();
}

class _SelectLocationPageState extends ConsumerState<SelectLocationPage> {
  //? The controller :
  late Completer<GoogleMapController> _controller;

  @override
  void initState() {
    super.initState();
    _controller = Completer<GoogleMapController>();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      addEventControllerProvider.select((val) => val.value!.selectedPlace),
      (prev, next) {
        if (next is AsyncLoading) {
          AppAlert.showLoadingDialog(context);
        }

        if (next is AsyncData) {
          context.pop();
          context.pop();
          print('------------------');
        }
        if (next is AsyncError) {
          context.pop();
          AppToast.errorToast(next!.error.toString());
        }
      },
    );

    ref.listen(
      updateEventControllerProvider.select((val) => val.value!.selectedPlace),
      (prev, next) {
        if (next is AsyncLoading) {
          AppAlert.showLoadingDialog(context);
        }

        if (next is AsyncData) {
          context.pop();
          context.pop();
          print('------------------');
        }
        if (next is AsyncError) {
          context.pop();
          AppToast.errorToast(next!.error.toString());
        }
      },
    );
    return Scaffold(
      body: Stack(
        children: [
          SelectLocationGoogleMap(_controller, widget.id),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 64.h),
            child: Column(
              children: [
                LocationSearchBox(
                  onSelect: (id, des) async {
                    if (widget.id == null) {
                      final notifier = ref.read(
                        addEventControllerProvider.notifier,
                      );

                      final latLng = await notifier.getPlaceLocation(id);

                      if (latLng != null) {
                        final GoogleMapController mapController =
                            await _controller.future;

                        mapController.animateCamera(
                          CameraUpdate.newLatLng(
                            LatLng(latLng.lat, latLng.lng),
                          ),
                        );
                      }
                    } else {
                      final notifier = ref.read(
                        updateEventControllerProvider.notifier,
                      );

                      final latLng = await notifier.getPlaceLocation(id);

                      if (latLng != null) {
                        final GoogleMapController mapController =
                            await _controller.future;

                        mapController.animateCamera(
                          CameraUpdate.newLatLng(
                            LatLng(latLng.lat, latLng.lng),
                          ),
                        );
                      }
                    }
                  },
                ),
                Spacer(),

                // (MediaQuery.of(context).size.height * .8).verticalSpace,
                CustomButtonWidget(
                  text: '',
                  onTap: () async {
                    // context.pop();
                    if (widget.id == null) {
                      await ref
                          .read(addEventControllerProvider.notifier)
                          .getPlaceInfoFromLatLng();
                    } else {
                      await ref
                          .read(updateEventControllerProvider.notifier)
                          .getPlaceInfoFromLatLng(widget.id!);
                    }
                  },
                  isFiled: true,
                  content: Text(
                    context.tr('confirm'),
                    style: AppTextStyle.nunitoBold16.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  height: 44.h,
                  width: 330.w,
                  backgroundColor: AppColors.primary,
                ),
                // (MediaQuery.of(context).size.height * .05).verticalSpace,
              ],
            ),
          ),
          // Positioned(
          //   // bottom: 54.h,
          //   top: 800.h,
          //   left: 22.w,
          //   right: 22.w,
          //   child: CustomButtonWidget(
          //     text: '',
          //     onTap: () async {
          //       // context.pop();
          //       if (widget.id == null) {
          //         await ref
          //             .read(addEventControllerProvider.notifier)
          //             .getPlaceInfoFromLatLng();
          //       } else {
          //         await ref
          //             .read(updateEventControllerProvider.notifier)
          //             .getPlaceInfoFromLatLng(widget.id!);
          //       }
          //     },
          //     isFiled: true,
          //     content: Text(
          //       context.tr('confirm'),
          //       style: AppTextStyle.nunitoBold16.copyWith(
          //         color: AppColors.white,
          //       ),
          //     ),
          //     height: 44.h,
          //     width: 330.w,
          //     backgroundColor: AppColors.primary,
          //   ),
          // ),
        ],
      ),
    );
  }
}
