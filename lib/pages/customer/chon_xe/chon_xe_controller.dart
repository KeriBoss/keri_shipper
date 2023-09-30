import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:keri_shipper/models/driver.dart';

class ChonXeController extends GetxController {
  LatLng sourceLocation = Get.arguments;

  Map<String, dynamic>? selectedCar;
  RxInt selectedIndex = RxInt(-1);
  RxList<Driver> listDriver = RxList();

  RxBool isVisibilityChooseCar = RxBool(true);
  RxBool isFindDriver = RxBool(false);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkDriver();
  }

  // kiem tra driver gan source
  checkDriver() {
    for (var item in listData) {
      double meters = Geolocator.distanceBetween(sourceLocation.latitude,
          sourceLocation.longitude, item.latitude, item.longitude);
      if (meters <= 5000) {
        item.distanceBetween = meters;
        listDriver.add(item);
      }
    }
    listDriver.sort(
      (a, b) => a.distanceBetween!.compareTo(b.distanceBetween!),
    );
  }

  List<Driver> listData = [
    Driver(
        id: '1',
        username: 'Driver 1',
        email: 'email',
        password: 'password',
        phone: '0908494152',
        typeRider: 'bike',
        latitude: 10.8580,
        longitude: 106.6271),
    Driver(
        id: '2',
        username: 'Driver 2',
        email: 'email',
        password: 'password',
        phone: '0908494153',
        typeRider: 'car',
        latitude: 10.8498,
        longitude: 106.6618),
    Driver(
        id: '3',
        username: 'Driver 3',
        email: 'email',
        password: 'password',
        phone: '0908494154',
        typeRider: 'bike',
        latitude: 10.8382,
        longitude: 106.7136),
    Driver(
        id: '4',
        username: 'Driver 4',
        email: 'email',
        password: 'password',
        phone: '0908494155',
        typeRider: 'car',
        latitude: 10.8438,
        longitude: 106.6772),
    Driver(
        id: '5',
        username: 'Driver 5',
        email: 'email',
        password: 'password',
        phone: '0908494156',
        typeRider: 'bike',
        latitude: 10.8386,
        longitude: 106.6223),
    Driver(
        id: '6',
        username: 'Driver 6',
        email: 'email',
        password: 'password',
        phone: '0908494157',
        typeRider: 'car',
        latitude: 10.8512,
        longitude: 106.5961),
    Driver(
        id: '7',
        username: 'Driver 7',
        email: 'email',
        password: 'password',
        phone: '0908494158',
        typeRider: 'car',
        latitude: 10.8450,
        longitude: 106.6219),
  ];
}
