import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:keri_shipper/constants/textstyle_ext.dart';
import 'package:keri_shipper/widgets/loading.dart';

import 'package:sizer/sizer.dart';
import 'find_rider_controller.dart';

class FindRiderPage extends StatelessWidget {
  var controller = Get.put(FindRiderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return controller.isLoading.value
            ? Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                        target: controller
                            .homePageController.currentUser.value!.position!,
                        zoom: 14.4746),
                    // myLocationEnabled: true,
                    mapType: MapType.normal,
                    // tiltGesturesEnabled: true,
                    // compassEnabled: false,
                    markers: {
                      Marker(
                          markerId: const MarkerId('You'),
                          position: controller
                              .homePageController.currentUser.value!.position!,
                          infoWindow:
                              const InfoWindow(title: "Vị trí hiện tại"),
                          icon: BitmapDescriptor.defaultMarker),
                      Marker(
                          markerId: MarkerId(controller.listRider[0].id),
                          position: LatLng(controller.listRider[0].latitude,
                              controller.listRider[0].longitude),
                          infoWindow: InfoWindow(
                              title:
                                  "${controller.getDistance(LatLng(controller.listRider[0].latitude, controller.listRider[0].longitude)).toStringAsFixed(2)} km"),
                          icon: controller.iconRider),
                      Marker(
                          markerId: MarkerId(controller.listRider[1].id),
                          position: LatLng(controller.listRider[1].latitude,
                              controller.listRider[1].longitude),
                          infoWindow: InfoWindow(
                              title:
                                  "${controller.getDistance(LatLng(controller.listRider[1].latitude, controller.listRider[1].longitude)).toStringAsFixed(2)} km"),
                          icon: controller.iconRider),
                      Marker(
                          markerId: MarkerId(controller.listRider[2].id),
                          position: LatLng(controller.listRider[2].latitude,
                              controller.listRider[2].longitude),
                          infoWindow: InfoWindow(
                              title:
                                  "${controller.getDistance(LatLng(controller.listRider[2].latitude, controller.listRider[2].longitude)).toStringAsFixed(2)} km"),
                          icon: controller.iconRider),
                      Marker(
                          markerId: MarkerId(controller.listRider[3].id),
                          position: LatLng(controller.listRider[3].latitude,
                              controller.listRider[3].longitude),
                          infoWindow: InfoWindow(
                              title:
                                  "${controller.getDistance(LatLng(controller.listRider[3].latitude, controller.listRider[3].longitude)).toStringAsFixed(2)} km"),
                          icon: controller.iconRider),
                    },
                    circles: {
                      Circle(
                          circleId: const CircleId('You'),
                          center: controller
                              .homePageController.currentUser.value!.position!,
                          radius: 500,
                          strokeWidth: 2,
                          strokeColor: Colors.lightBlue,
                          fillColor: const Color(0xff006491).withOpacity(0.2))
                    },
                    onMapCreated: (controller) {
                      this.controller.mapController.complete(controller);
                    },
                  ),
                  Positioned(
                    left: 10,
                    right: 10,
                    bottom: 20,
                    child: Container(
                      width: 100.w,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300,
                                offset: const Offset(0, 5),
                                blurRadius: 2,
                                spreadRadius: 2)
                          ]),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/feature/grab_bike.png',
                            width: 50,
                            height: 50,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Obx(() {
                            return controller.isFind.value == false
                                ? Text(
                                    "Đang tìm tài xế...",
                                    style: TextStyles.defaultStyle.medium
                                        .setTextSize(18),
                                  )
                                : Text(
                                    "Đang kết nối bạn với tài xế",
                                    style: TextStyles.defaultStyle.medium
                                        .setTextSize(18),
                                  );
                          }),
                        ],
                      ),
                    ),
                  )
                ],
              )
            : Loading();
      }),
    );
  }
}
