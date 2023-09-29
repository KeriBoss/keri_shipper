import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:keri_shipper/pages/customer/form_to/form_to_controller.dart';
import 'package:keri_shipper/widgets/loading.dart';

class GoogleScreen extends StatefulWidget {
  const GoogleScreen({Key? key}) : super(key: key);

  @override
  State<GoogleScreen> createState() => _GoogleScreenState();
}

class _GoogleScreenState extends State<GoogleScreen> {
  FormToController formToController = Get.find();
  late GoogleMapController mapController;
  Map<MarkerId, Marker> markers = {};
  LatLng? center;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }

  getCurrentLocation() async {
    // List<Location> origin = await locationFromAddress(
    //     formToController.diemDi.value);
    // List<Location> destination = await locationFromAddress(
    //     formToController.diemDen.value);
    addMarker(
        formToController.source, 'Điểm đi', BitmapDescriptor.defaultMarker);
    addMarker(formToController.destination, 'Điểm đến',
        BitmapDescriptor.defaultMarkerWithHue(90));

    center = formToController.source;
    setState(() {});
  }

  onCreate(GoogleMapController controller) async {
    mapController = controller;
  }

  addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(
        markerId: markerId,
        icon: descriptor,
        position: position,
        infoWindow: InfoWindow(title: id));
    markers[markerId] = marker;
  }

  @override
  Widget build(BuildContext context) {
    return center == null
        ? Loading()
        : Scaffold(
            body: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition:
                      CameraPosition(target: center!, zoom: 14.4746),
                  myLocationEnabled: true,
                  mapType: MapType.normal,
                  tiltGesturesEnabled: true,
                  compassEnabled: false,
                  markers: Set<Marker>.of(markers.values),
                  onMapCreated: onCreate,
                  // circles: {
                  //   Circle(
                  //       circleId: const CircleId('origin'),
                  //       center: center!,
                  //       radius: 500,
                  //       strokeWidth: 2,
                  //       strokeColor: Colors.lightBlue,
                  //       fillColor: const Color(0xff006491).withOpacity(0.2)
                  //   )
                  // },
                ),
              ],
            ),
          );
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
}
