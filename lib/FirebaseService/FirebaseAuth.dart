import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:keri_shipper/TaiKhoan/login/view.dart';
import 'package:keri_shipper/pages/Snack.dart';

import '../models/UserModel.dart';
import '../dialog/dialog.dart';

class FirebaseAuthen {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  //FirebaseAuthen();

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // Sign in
  Future<void> signIn(
      String email, String password, BuildContext context) async {
    try {
      DiaLog.showIndicatorDialog();
      await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', email.trim());
        await prefs.setString('password', password.trim());
        if (_firebaseAuth.currentUser != null) {
          _firebaseFirestore
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .update({"password": password});

          _firebaseFirestore
              .collection("users")
              .doc(_firebaseAuth.currentUser!.uid)
              .get()
              .then((value) {
            Get.offAllNamed("/splash");
          });
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.close(1);
        Get.defaultDialog(
            title: "Thông báo", content: const Text("Email chưa đăng ký"));
      } else if (e.code == 'wrong-password') {
        Get.close(1);
        Get.defaultDialog(
            title: "Thông báo", content: const Text("Sai mật khẩu"));
      } else {
        Get.close(1);
        Get.defaultDialog(
            title: "Thông báo", content: Text(e.message.toString()));
      }
    }
  }

  Future<bool> signIn2(String email, String password) async {
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        if (value.user != null) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('email', email.trim());
          await prefs.setString('password', password.trim());
          return true;
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.back();
        Snack.show("Thông báo", "Email chưa đăng ký");
      } else if (e.code == 'wrong-password') {
        Get.back();
        Snack.show("Thông báo", "Sai mật khẩu");
      }
    }
    return false;
  }

  // Sign up
  Future<bool> signUp(String email, String password, String username,
      String address, String phone, int role, BuildContext context,
      {String? thongTinThem}) async {
    try {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              child: Container(
                alignment: FractionalOffset.center,
                height: 150.0,
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "Loading",
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
          });
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        if (value.user != null) {
          return await creeateUser(
              FirebaseAuth.instance.currentUser!.uid,
              email,
              password,
              username,
              address,
              phone,
              "",
              "",
              "",
              "",
              "",
              "",
              role,
              "",
              thongTinThem: thongTinThem);
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Get.close(1);
        Snack.show(
          "Thông báo",
          "Email đã tồn tại trên hệ thống",
        );
        return false;
      }
      print(e);
    }
    return false;
  }

  Future<bool> creeateUser(
      String id,
      String email,
      String password,
      String username,
      String address,
      String phone,
      String soCMND,
      String soBHYT,
      String avatarlink,
      String avatarname,
      String gender,
      String birthDay,
      int role,
      String maGioiThieu,
      {String? thongTinThem}) async {
    UserModel userModel = UserModel(id, username, email, password, address,
        avatarname, avatarlink, phone, false, role, gender, birthDay, false,
        thongTinThem: thongTinThem);

    await _firebaseFirestore
        .collection('users')
        .doc(userModel.id)
        .set(userModel.toJson())
        .then((value) {
      Get.close(2);
      Get.defaultDialog(
          title: "Thông báo", content: const Text("Tạo tài khoản thành công"));
      return true;
    });

    return false;
  }

  // SignOut
  Future<void> signOut(BuildContext context) async {
    await _firebaseAuth.signOut();
    Get.delete();
    Get.offAllNamed("/login");
  }

  Future<void> passwordRest(String email, BuildContext context) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text(
                "Thông báo",
                style: TextStyle(color: Colors.blue),
              ),
              content: Text(
                  "Link lấy đổi mật khẩu đã được gửi, Vui lòng kiểm tra email"),
            );
          });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("Thông báo", "Email chưa đăng ký");
      } else {
        print(e.toString());
      }
    }
  }

  void getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    await _firebaseFirestore
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .update({
      "token": token,
    });
  }

  void deleteToken() async {
    String? token = "";
    await _firebaseFirestore
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .update({
      "token": token,
    });
  }

  var verificationId = ''.obs;

  Future<void> SignUpPhone(String phone) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _firebaseAuth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar("Error", "Cung cấp đúng số điện thoại của bạn");
        } else {
          Get.snackbar("Error", "Lỗi! Vui lòng nhập lại");
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

  Future<bool> verifiOTP(String otp) async {
    var credentials = await _firebaseAuth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: this.verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return LoginPage();
        } else {
          return LoginPage();
        }
      },
    );
  }

  signInWithGoogle() async {
    // Trigger the authentication flow
    // final GoogleSignInAccount? googleUser = await GoogleSignIn(scopes: <String>[
    //   'email',
    // ]).signIn();
    // if (googleUser != null) {
    //   final GoogleSignInAuthentication googleAuth =
    //       await googleUser.authentication;
    //
    //   // Create a new credential
    //   OAuthCredential credential = GoogleAuthProvider.credential(
    //     accessToken: googleAuth.accessToken,
    //     idToken: googleAuth.idToken,
    //   );
    //
    //   // Once signed in, return the UserCredential
    //   await FirebaseAuth.instance.signInWithCredential(credential);
    //   if (FirebaseAuth.instance.currentUser != null) {
    //     await creeateUser(
    //         FirebaseAuth.instance.currentUser!.uid,
    //         googleUser.email,
    //         "",
    //         googleUser.displayName!,
    //         "",
    //         "",
    //         "",
    //         "",
    //         googleUser.photoUrl!,
    //         "",
    //         "",
    //         "",
    //         1,
    //         '');
    //     // Obtain the auth details from the request
    //   }
    // }
  }
}
