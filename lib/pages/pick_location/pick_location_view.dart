import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
import 'pick_location_controller.dart';

class PickLocationPage extends GetView<PickLocationController> {
  Function(String addres, LatLong? positioned)? f;

  PickLocationPage({Key? key, required this.initPosition, this.f})
      : super(key: key);
  LatLong? initPosition;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: FlutterLocationPicker(
            searchBarHintText: "Tìm kiếm vị trí",
            initPosition: initPosition,
            selectLocationButtonStyle: TextButton.styleFrom(
                padding: EdgeInsets.all(0),
                textStyle: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white)),
            selectLocationButtonText: "Chọn vị trí này",
            mapAnimationDuration: Duration(milliseconds: 700),
            initZoom: 11,
            minZoomLevel: 5,
            maxZoomLevel: 16,
            trackMyPosition: true,
            searchBarBackgroundColor: Colors.white,
            mapLanguage: 'vi',
            onError: (e) => print(e),
            onPicked: (pickedData) async {
              print(pickedData.latLong.latitude);
              print(pickedData.latLong.longitude);
              print(pickedData.address);
              print(pickedData.addressData);
              if (f != null) {
                f!(pickedData.address, pickedData.latLong);
                Get.close(1);
              } else {
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .update({
                  "latitude": pickedData.latLong.latitude,
                  "longtitude": pickedData.latLong.longitude,
                  "address": pickedData.address
                }).then((value) {
                  Get.close(1);
                });
              }
            }),
      ),
    );
  }
}
