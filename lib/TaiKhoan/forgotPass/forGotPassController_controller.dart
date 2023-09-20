import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:keri_shipper/constants/color_constants.dart';
import 'package:keri_shipper/dialog/dialog.dart';

class ForGotPassController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var userNameController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  var role = 1.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  Future<void> forgotPassword() async {
    try {
      DiaLog.showIndicatorDialog();
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text)
          .then((value) {
        Get.close(1);
        Get.defaultDialog(
          title: "Thông báo",
          middleText:
              "Link đổi mật khẩu đã gửi đến email của bạn, Vui lòng vào email kiểm tra",
          backgroundColor: Colors.white,
          titleStyle: const TextStyle(color: ColorConstants.primaryColor),
          middleTextStyle: const TextStyle(color: ColorConstants.primaryColor),
          radius: 30,
        );
      });
    } on FirebaseAuthException catch (e) {
      Get.close(1);
      if (e.code == 'user-not-found') {
        Get.snackbar("Thông báo", "Email chưa đăng ký",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: ColorConstants.primaryColor,
            colorText: Colors.white);
      } else {
        print(e.toString());
      }
    }
  }
}
