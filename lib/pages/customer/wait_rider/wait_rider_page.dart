import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:sizer/sizer.dart';
import 'wait_rider_controller.dart';

class FindRiderPage extends StatelessWidget {
  var controller = Get.put(WaitRiderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Stack(
          children: [],
        );
      }),
    );
  }
}
