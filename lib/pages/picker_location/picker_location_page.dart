import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:keri_shipper/constants/color_palette.dart';
import 'package:keri_shipper/constants/textstyle_ext.dart';
import 'package:keri_shipper/widgets/loading.dart';

import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
import 'package:map_picker/map_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_map/flutter_map.dart';

class PickerLocationPage extends StatefulWidget {
  const PickerLocationPage({Key? key, this.location, required this.center})
      : super(key: key);

  final Function(String address, LatLng position)? location;
  final LatLng center;

  @override
  State<PickerLocationPage> createState() => _PickerLocationPageState();
}

class _PickerLocationPageState extends State<PickerLocationPage> {
  CameraPosition? cameraPosition;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    update();
  }

  update() async {
    cameraPosition = CameraPosition(
      target: widget.center,
      zoom: 14.4746,
    );
    await pickData().then((value) {
      textController.text = value.address;
      subTextController.text = value.addressData.values.first;
      setState(() {});
    });
  }

  final _controller = Completer<GoogleMapController>();
  MapPickerController mapPickerController = MapPickerController();
  MapController mapController = MapController();
  var textController = TextEditingController();
  var subTextController = TextEditingController();

  Future<PickedData> pickData() async {
    LatLong center = LatLong(widget.center.latitude, widget.center.latitude);
    var client = http.Client();
    String url =
        'https://nominatim.openstreetmap.org/reverse?format=json&lat=${cameraPosition!.target.latitude}&lon=${cameraPosition!.target.longitude}&zoom=18&addressdetails=1&accept-language=vi';
    var response = await client.get(Uri.parse(url));
    var decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<dynamic, dynamic>;
    String displayName = "This Location is not accessible";
    Map<String, dynamic> address;

    if (decodedResponse['display_name'] != null) {
      displayName = decodedResponse['display_name'];
      address = decodedResponse['address'];
    } else {
      center = const LatLong(0, 0);
      address = decodedResponse as Map<String, dynamic>;
    }
    return PickedData(center, displayName, address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cameraPosition == null
          ? Loading()
          : Stack(
              children: [
                MapPicker(
                  // pass icon widget
                  iconWidget: Image.asset(
                    'assets/images/ic_picker_map.png',
                    width: 25,
                    height: 25,
                  ),
                  //add map picker controller
                  mapPickerController: mapPickerController,
                  child: GoogleMap(
                    myLocationEnabled: true,
                    mapType: MapType.normal,
                    tiltGesturesEnabled: true,
                    compassEnabled: false,
                    //  camera position
                    initialCameraPosition: cameraPosition!,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    onCameraMoveStarted: () {
                      // notify map is moving
                      mapPickerController.mapMoving!();
                      textController.text = "checking ...";
                    },
                    onCameraMove: (cameraPosition) {
                      this.cameraPosition = cameraPosition;
                    },
                    onCameraIdle: () async {
                      // notify map stopped moving
                      mapPickerController.mapFinishedMoving!();
                      //get address name from camera position
                      // List<Placemark> placemarks = await placemarkFromCoordinates(
                      //   cameraPosition!.target.latitude,
                      //   cameraPosition!.target.longitude,
                      // );
                      // // update the ui with the address
                      // subTextController.text = '${placemarks.first.street}';
                      //     //'${placemarks.first.thoroughfare == "" ? "" : "${placemarks.first.thoroughfare} "}';
                      // textController.text = ''
                      //     '${placemarks.first.street}, '
                      //     //'${placemarks.first.thoroughfare == "" ? "" : "${placemarks.first.thoroughfare}, "}'
                      //     '${placemarks.first.subAdministrativeArea == "" ? "" : "${placemarks.first.subAdministrativeArea}, "}'
                      //     '${placemarks.first.administrativeArea == "" ? "" : "${placemarks.first.administrativeArea}"}';
                      textController.clear();
                      subTextController.clear();
                      await pickData().then((value) {
                        textController.text = value.address;
                        subTextController.text = value.addressData.values.first;
                        setState(() {});
                      });
                    },
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 100.w,
                    color: Colors.white,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        textController.text.isNotEmpty
                            ? Container(
                                padding: const EdgeInsets.all(16),
                                color: const Color(0xffEAEAEA),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_rounded,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            subTextController.text,
                                            style: TextStyles.defaultStyle.bold,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            textController.text,
                                            style:
                                                TextStyles.defaultStyle.light,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ))
                            : const SizedBox(
                                height: 54,
                                child: SpinKitThreeBounce(
                                  color: Colors.grey,
                                  size: 20,
                                )),
                        const SizedBox(
                          height: 16,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (widget.location != null) {
                              widget.location!(
                                  textController.text,
                                  LatLng(
                                    cameraPosition!.target.latitude,
                                    cameraPosition!.target.longitude,
                                  ));
                              Get.close(1);
                            }
                          },
                          child: Container(
                              width: 100.w,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorPalette.secondColor,
                              ),
                              child: Center(
                                child: Text(
                                  "Xác nhận điểm đến / đi",
                                  style: TextStyles
                                      .defaultStyle.semiBold.whiteTextColor
                                      .setTextSize(18),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
