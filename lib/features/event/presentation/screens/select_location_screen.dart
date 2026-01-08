import 'dart:async';
import 'dart:ui' as ui;

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
import 'package:kroot_app/gen/assets.gen.dart';
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
        }
        if (next is AsyncError) {
          context.pop();
          AppToast.errorToast(next!.error.toString());
        }
      },
    );
    return Scaffold(body: _buildMap(context));
  }

  SizedBox _buildConfirmButton(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButtonWidget(
            text: '',
            onTap: () async {
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
              style: AppTextStyle.nunitoBold16.copyWith(color: AppColors.white),
            ),
            height: 44.h,
            width: 260.w,
            backgroundColor: AppColors.primary,
          ),
          // 12.horizontalSpace,
          Spacer(),
          IconButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColors.white),
            ),
            onPressed: () {
              final location = ref
                  .watch(addEventControllerProvider)
                  .value!
                  .initialLatLng;

              ref
                  .read(addEventControllerProvider.notifier)
                  .changeLatlng(location!.lat, location.lng);
              setState(() {});
            },
            icon: Icon(Icons.my_location_outlined),
          ),
        ],
      ),
    );
  }

  Stack _buildMap(BuildContext context) {
    final local = context.locale.languageCode;
    return Stack(
      children: [
        SelectLocationGoogleMap(_controller, widget.id),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 64.h),
          child: Column(
            children: [
              Directionality(
                textDirection: ui.TextDirection.rtl,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: LocationSearchBox(
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
                    ),
                    12.horizontalSpace,
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: GestureDetector(
                        onTap: () => context.pop(),
                        child: Assets.icons.verificationArrowBackIc.svg(
                          width: 30.w,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Spacer(),
              _buildConfirmButton(context),
            ],
          ),
        ),
      ],
    );
  }
}
