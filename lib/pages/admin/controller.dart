import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  MainController();
  final Rx<GlobalKey<ScaffoldState>> scaffoldKey =
      Rx(GlobalKey<ScaffoldState>());

  RxInt index = RxInt(0);
  void controlMenu() {
    if (!scaffoldKey.value.currentState!.isDrawerOpen) {
      scaffoldKey.value.currentState!.openDrawer();
    }
  }

  void setIndexPage(int i) {
    index.value = i;
  }
}
