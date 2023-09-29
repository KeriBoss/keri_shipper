import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:keri_shipper/pages/customer/bottom_navigation/home_page_controller.dart';

class FindRiderController extends GetxController {
  Completer<GoogleMapController> mapController = Completer();
  LatLng sourceLocation = const LatLng(10.8538, 106.6278);
  RxBool isLoading = RxBool(false);
  RxBool isFind = RxBool(false);
  late BitmapDescriptor iconRider;
  HomePageController homePageController = Get.find();
  List<Rider> listRider = [
    // Rider(id: '1', name: 'Rider 1', phone: '0908494152', typeRider: 'car', latitude: 10.8444, longitude: 106.6250),
    Rider(
        id: '1',
        name: 'Rider 1',
        phone: '0908494152',
        typeRider: 'bike',
        latitude: 10.8580,
        longitude: 106.6271),
    Rider(
        id: '2',
        name: 'Rider 2',
        phone: '0908494153',
        typeRider: 'car',
        latitude: 10.8504,
        longitude: 106.6309),
    Rider(
        id: '3',
        name: 'Rider 3',
        phone: '0908494154',
        typeRider: 'bike',
        latitude: 10.8526,
        longitude: 106.6355),
    Rider(
        id: '4',
        name: 'Rider 4',
        phone: '0908494155',
        typeRider: 'car',
        latitude: 10.8570,
        longitude: 106.6361),
  ];

  Rxn<Set<Marker>> markers = Rxn();

  double getDistance(LatLng positionRider) {
    double meters = Geolocator.distanceBetween(
        sourceLocation.latitude,
        sourceLocation.longitude,
        positionRider.latitude,
        positionRider.longitude);
    double kilometer = meters / 1000;
    return kilometer;
  }

  Map<String, dynamic>? selectedCar;

  addPickupMarker(LatLng position, String id) {
    markers.value?.add(Marker(
        markerId: MarkerId(id),
        position: position,
        anchor: const Offset(0, 0.85),
        zIndex: 3,
        infoWindow: const InfoWindow(title: "Pickup", snippet: "location"),
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure)));
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    if (Get.arguments != null) {
      selectedCar = Get.arguments;
    }
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(20, 20)),
            'assets/images/feature/grab_bike_160.png')
        .then((onValue) {
      iconRider = onValue;
    }).whenComplete(() => isLoading.value = true);
    checkRider();
  }

  checkRider() {
    for (var rider in listRider) {
      double meters = Geolocator.distanceBetween(sourceLocation.latitude,
          sourceLocation.longitude, rider.latitude, rider.longitude);
      // rider trong 500 met
      if (meters <= 500) {
        isFind.value = true;
      } else {
        isFind.value = false;
      }
    }
  }
}

class Rider {
  String id;
  String name;
  String phone;
  String typeRider;
  double latitude;
  double longitude;

  Rider(
      {required this.id,
      required this.name,
      required this.phone,
      required this.typeRider,
      required this.latitude,
      required this.longitude});
}
