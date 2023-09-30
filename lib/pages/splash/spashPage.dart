import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keri_shipper/pages/admin/dash_board_screen.dart';
import 'package:keri_shipper/pages/customer/bottom_navigation/home_page_controller.dart';
import 'package:keri_shipper/pages/customer/bottom_navigation/home_screen.dart';
import 'package:keri_shipper/pages/customer/bottom_navigation/main_screen.dart';
import 'package:keri_shipper/pages/home_driver/home_driver_view.dart';
import 'package:keri_shipper/pages/onBoardingPage.dart';

import '../../FirebaseService/ProviderUser.dart';
import '../../models/UserModel.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Rxn<UserModel> currentUser = Rxn();
  UserProvider userProvider = UserProvider();
  @override
  void initState() {
    redirectIntroPage();
    super.initState();
  }

  void redirectIntroPage() async {
    //final ignoreIntroPage = LocalStorageService.getValue('ignoreIntroPage') as bool?;
    await Future.delayed(const Duration(seconds: 1));
    if (FirebaseAuth.instance.currentUser != null) {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((value) async {
        UserModel currentUser = UserModel.fromJson(value.data()!);
        if (currentUser.role == 2) {
          Get.to(() => HomeDriverPage());
        }
        if (currentUser.role == 1) {
          Get.to(() => MainScreen());
        }
        if (currentUser.role == 0) {
          Get.to(() => DashBoardScreen());
        }
      });
    } else {
      Get.offAllNamed("/login");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                width: Get.width / 3,
                height: Get.width / 3,
                child: Image.asset("assets/images/logo.png"),
              ),
              SizedBox(
                height: 10,
              ),
              CircularProgressIndicator(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}
