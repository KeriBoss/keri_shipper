import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keri_shipper/FirebaseService/FirebaseAuth.dart';
import 'package:keri_shipper/TaiKhoan/verifiedPhone/verifiedPhonePage.dart';
import 'package:keri_shipper/dialog/dialog.dart';
import 'package:keri_shipper/models/UserModel.dart';
import 'package:keri_shipper/pages/Snack.dart';
import 'package:keri_shipper/provider/sms_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class RegisterDriverController extends GetxController {
  FirebaseAuthen _firebaseAuthen = FirebaseAuthen();
  String qrCodeData = "";
  var username = TextEditingController();
  var soCMND = TextEditingController();
  var email = TextEditingController();
  var phoneNumber = TextEditingController();
  var address = TextEditingController();
  var password = TextEditingController();
  var cfPassword = TextEditingController();
  var maGioiThieu = TextEditingController();
  var birthDay = TextEditingController();
  GlobalKey<FormState> keys = GlobalKey<FormState>();
  RxString gender = RxString("Nam");
  var cmndMatTruoc = "".obs;
  var cmndMatSau = "".obs;
  var anhXe = "".obs;
  final storage = FirebaseStorage.instance.ref();
  void SignUp(BuildContext context) async {
    try {
      DiaLog.showIndicatorDialog();
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text, password: email.text)
          .then((value) async {
        if (value.user != null) {
          var uuid = Uuid();
          String id = value.user!.uid;
          var ref = storage.child("/CCCDMT").child(id);
          var ref2 = storage.child("/CCCDMS").child(id);
          var ref3 = storage.child("/AnhXe").child(id);
          String url1 = '';
          String url2 = '';
          String url3 = '';

          if (cmndMatTruoc.value.isNotEmpty) {
            String filePath = cmndMatTruoc.value;
            await ref.putFile(File(filePath));
            url1 = (await ref.getDownloadURL()).toString();
          }
          if (cmndMatSau.value.isNotEmpty) {
            String filePath = cmndMatSau.value;
            await ref2.putFile(File(filePath));
            url2 = (await ref2.getDownloadURL()).toString();
          }
          if (anhXe.value.isNotEmpty) {
            String filePath = anhXe.value;
            await ref3.putFile(File(filePath));
            url3 = (await ref3.getDownloadURL()).toString();
          }

          UserModel userModel = UserModel(
              value.user!.uid,
              username.text,
              email.text,
              password.text,
              address.text,
              "",
              "",
              phoneNumber.text,
              false,
              2,
              gender.value,
              birthDay.text,
              false,
              thongTinThem: "",
              trangThai: "Chờ xác nhận",
              cMNDTruoc: url1,
              cMNDSau: url2,
              anhXe: url3);

          await FirebaseFirestore.instance
              .collection('users')
              .doc(userModel.id)
              .set(userModel.toJson())
              .then((value) {
            String code = generateRandomString(6);
            Get.close(1);
            Get.defaultDialog(
                title: "Thông báo",
                content: const Text("Tạo tài khoản thành công"));
            String message =
                'Vinaship: Ma OTP $code su dung de xac thuc tai khoan. Tran trong!';
            SMSProvider().sendSMS(message, phoneNumber.text);
            Get.to(() => VerifiedPhonePage(),
                arguments: [phoneNumber.text, code]);
          });
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Get.close(1);
        Snack.show(
          "Thông báo",
          "Email đã tồn tại trên hệ thống",
        );
      }
      print(e);
    }
  }

  final ImagePicker _picker = ImagePicker();
  pickImageFromLibrary(RxString val) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      val.value = pickedFile.path;
    }
  }

  String generateRandomString(int len) {
    var r = Random();
    const _chars = '1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  void loadDatafromQR() {
    List<String> data = qrCodeData.split("|");
    soCMND.text = data[0];
    username.text = data[2];
    address.text = data[5];
  }
}
