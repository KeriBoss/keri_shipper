import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../FirebaseService/FirebaseAuth.dart';

import '../login/view.dart';

class RegisterLogic extends GetxController {
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

  GlobalKey<FormState> keys = GlobalKey<FormState>();

  void SignUp(BuildContext context) {
    _firebaseAuthen.signUp(
      email.text.trim(),
      password.text.trim(),
      username.text.trim(),
      address.text.trim(),
      phoneNumber.text.trim(),
      1,
      context,
    );
  }

  void loadDatafromQR() {
    List<String> data = qrCodeData.split("|");
    soCMND.text = data[0];
    username.text = data[2];
    address.text = data[5];
  }
}
