import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keri_shipper/models/UserModel.dart';

import 'package:keri_shipper/provider/ProviderUser.dart';

class DSTaiKhoanDoiTacController extends GetxController {
  final count = 0.obs;
  late TabController tabController;
  UserProvider userProvider = UserProvider();
  List<String> listRole = [
    "All",
    "Khách hàng",
    "Người giao hàng",
  ];
  TextEditingController searchField = TextEditingController();
  RxString selectedRole = "All".obs;
  RxList<UserModel> list = RxList();
  List<UserModel> listSrc = [];
  @override
  void onInit() async {
    listSrc = await userProvider.getAllUser();
    list.value = listSrc;

    print(listSrc);
    listen();
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  increment() => count.value++;

  final formKey = GlobalKey<FormState>();
  final nameTypeOfExaminationController = TextEditingController();
  sortByRole(num role) {
    list.value = listSrc.where((element) => element.role == role).toList();
  }

  search(String keyword) {
    if (selectedRole.value == "Admin") {
      sortByRole(0);
    }
    if (selectedRole.value == "Khách hàng") {
      sortByRole(1);
    }
    if (selectedRole.value == "Người giao hàng") {
      sortByRole(2);
    }

    if (keyword.isNotEmpty) {
      list.value = list
          .where((p0) =>
              p0.username.toLowerCase().contains(keyword.toLowerCase()) ||
              p0.address.toLowerCase().contains(keyword.toLowerCase()) ||
              p0.phone.toLowerCase().contains(keyword.toLowerCase()) ||
              p0.email.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    } else {
      if (selectedRole.value == "All") {
        list.value = listSrc;
      }
    }
  }

  sortByPhongKham() {}
  void listen() async {
    await FirebaseFirestore.instance
        .collection("users")
        .snapshots()
        .listen((event) async {
      listSrc = await userProvider.getAllUser();
      list.value = listSrc;

      if (selectedRole.value == "Quản trị viên") {
        sortByRole(0);
      }
      if (selectedRole.value == "Khách hàng") {
        sortByRole(1);
      }

      if (selectedRole.value == "All") {
        list.value = listSrc;
      }
    });
  }
}
