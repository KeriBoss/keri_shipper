import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keri_shipper/FirebaseService/ProviderUser.dart';
import 'package:keri_shipper/constants/color_constants.dart';
import 'package:keri_shipper/dialog/dialog.dart';
import 'package:keri_shipper/models/UserModel.dart';

class UpdatePasswordController extends GetxController {
  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;

  Rxn<UserModel> currentUser = Rxn<UserModel>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordNewController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  UserProvider userProvider = UserProvider();

  var formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    LoadData();
  }

  void LoadData() async {
    currentUser.value = await userProvider.getUser();
    emailController =
        TextEditingController(text: FirebaseAuth.instance.currentUser!.email);
  }

  void ChangePassword(BuildContext context) async {
    DiaLog.showIndicatorDialog();
    await FirebaseAuth.instance.currentUser!
        .updatePassword(passwordController.text);
    Get.close(1);
    Get.snackbar("Thông báo", "Đổi mật khẩu thành công",
        snackPosition: SnackPosition.TOP,
        backgroundColor: ColorConstants.primaryColor,
        colorText: Colors.white);
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({"password": passwordController.text});
    Get.delete();
    Get.offAllNamed("/login");
  }
}
