import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../FirebaseService/FirebaseAuth.dart';

class LoginController extends GetxController {
  var email = TextEditingController();
  var password = TextEditingController();
  final key = GlobalKey<FormState>();
  final FirebaseAuthen _firebaseAuthen = FirebaseAuthen();
  RxBool isHide = RxBool(true);
  void Login(BuildContext context) async {
    _firebaseAuthen.signIn(email.text.trim(), password.text.trim(), context);
  }
}
