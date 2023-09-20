import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keri_shipper/dialog/dialog.dart';

import 'package:keri_shipper/validate/validate.dart';

import '../UpdatePassword/UpdatePasswordPage.dart';
import 'VerifiedPhoneRessetPage.dart';

class VerifiedPhoneRessetController extends GetxController {
  String phoneNumber = "";
  String verifiedId = "";
  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  VerifiedPhoneRessetController();
  @override
  void onInit() {
    super.onInit();
  }

  verifiedCode() async {
    try {
      DiaLog.showIndicatorDialog();
// Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verifiedId, smsCode: codeController.text);

      // Sign the user in (or link) with the credential

      QuerySnapshot checkPhone = await FirebaseFirestore.instance
          .collection("user")
          .where("phone", isEqualTo: phoneNumber)
          .get();

      if (checkPhone.docs.isNotEmpty) {
        Get.back();
        await FirebaseAuth.instance.signInWithCredential(credential);
        Get.to(UpdatePasswordPage());
      } else {
        Get.back();
        DiaLog.showCofirmDialog(
          "Thông báo ",
          'Số điện thoại này không trùng khớp với bất kì tài khoản nào.',
        );
      }
    } on FirebaseAuthException catch (e) {
      Get.back();

      if (e.code == "provider-already-linked") {
        DiaLog.showCofirmDialog(
          "Thông báo ",
          'Số điện thoại này đã được liên kết với một tài khoản khác.',
        );
      }
      if (e.code == "credential-already-in-use") {
        DiaLog.showCofirmDialog(
          "Thông báo ",
          'Số điện thoại này đã được liên kết với một tài khoản khác..',
        );
      } else {
        DiaLog.showCofirmDialog(
          "Thông báo ",
          'Xác thực thất bại ',
        );
      }
    }
  }

  verifiedPhone() async {
    if (validatorPhoneNumber(phoneController.text) == null) {
      var phone = "+84";
      phoneNumber = phoneController.text;
      DiaLog.showIndicatorDialog();

      if (phoneController.text[0] == "0") {
        phone = phone + phoneController.text.substring(1);
      } else {
        phone = phone + phoneNumber;
      }
      print(phone);

      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) {
          print("verificationCompleted");
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.toString());
          Get.back(closeOverlays: true);
          Get.defaultDialog(
              title: "Thông báo ", content: const Text('Xác thực thất bại .'));
        },
        codeSent: (String verificationId, int? resendToken) {
          verifiedId = verificationId;
          Get.close(1);

          Get.to(VerifiedPhoneRessetPage());
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    }
  }
}
