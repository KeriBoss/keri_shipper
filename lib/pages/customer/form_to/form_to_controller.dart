import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FormToController extends GetxController {
  var diemDenController = TextEditingController();
  var diemDiController = TextEditingController();
  var diemDen = 'Đến đâu?'.obs;
  var diemDi = 'Vị trí hiện tại'.obs;
  late LatLng source;
  late LatLng destination;
  late Position position;
  Rxn<LatLng> center = Rxn();


  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getUserLocation();
  }

  getUserLocation() async {
    position = await Geolocator.getCurrentPosition();
    center.value = LatLng(position.latitude, position.longitude);
  }
}