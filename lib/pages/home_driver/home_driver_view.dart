import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_driver_controller.dart';

class HomeDriverPage extends GetView<HomeDriverController> {
  HomeDriverPage({Key? key}) : super(key: key);
  HomeDriverController controller = Get.put(HomeDriverController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
