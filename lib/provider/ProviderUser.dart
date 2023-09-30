import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:keri_shipper/dialog/dialog.dart';

import '../models/UserModel.dart';

class UserProvider {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<UserModel?> getUser() async {
    if (FirebaseAuth.instance.currentUser != null) {
      final snapshot = await firestore
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      Map<String, dynamic>? jsonValue = snapshot.data();
      if (jsonValue != null) {
        return UserModel.fromJson(jsonValue);
      }
    }
    return null;
  }

  Future delteUser(UserModel userModel, currentEmail, currentPass) async {
    //current user'
    DiaLog.showIndicatorDialog();
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userModel.id)
          .delete();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userModel.email.trim(), password: userModel.password);

      await FirebaseAuth.instance.currentUser!.delete();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: currentEmail, password: currentPass);
      Get.close(1);
      DiaLog.showSnackBar("Thông báo", "Đã xóa tài khoản thành công");
    } catch (e) {
      Get.close(1);
      DiaLog.showSnackBar("Thông báo", "Lỗi " + e.toString());
    }
  }

  Future<UserModel?> getUserByID(id) async {
    if (FirebaseAuth.instance.currentUser != null) {
      final snapshot = await firestore.collection("users").doc(id).get();
      if (snapshot.data() != null) {
        Map<String, dynamic> jsonValue = snapshot.data()!;
        return UserModel.fromJson(jsonValue);
      } else {
        return null;
      }
    }
    return null;
  }

  Future<List<UserModel>> getAllUser() async {
    List<UserModel> list = [];
    if (FirebaseAuth.instance.currentUser != null) {
      final snapshot = await firestore
          .collection("users")
          .where("role", isNull: false)
          .get()
          .then((value) {
        list = value.docs
            .map<UserModel>((value) => UserModel.fromJson(value.data()))
            .toList();
      });
    }
    return list;
  }

  Future<List<UserModel>> getAllUserAdmin() async {
    List<UserModel> list = [];

    final snapshot = await firestore
        .collection("users")
        .where("role", isEqualTo: 0)
        .get()
        .then((value) {
      list = value.docs
          .map<UserModel>((value) => UserModel.fromJson(value.data()))
          .toList();
    });

    return list;
  }

  Future<List<UserModel>> getAllUserByRole(int role) async {
    List<UserModel> list = [];

    final snapshot = await firestore
        .collection("users")
        .where("role", isEqualTo: role)
        .get()
        .then((value) {
      list = value.docs
          .map<UserModel>((value) => UserModel.fromJson(value.data()))
          .toList();
    });

    return list;
  }

  Future<UserModel?> getUserAdmin() async {
    List<UserModel> list = [];
    if (FirebaseAuth.instance.currentUser != null) {
      final snapshot = await firestore
          .collection("users")
          .where("role", isEqualTo: 0)
          .get()
          .then((value) {
        list = value.docs
            .map<UserModel>((value) => UserModel.fromJson(value.data()))
            .toList();
      });
    }
    return list.isEmpty ? null : list.first;
  }

  Future setUser(UserModel userModel) async {
    if (FirebaseAuth.instance.currentUser != null) {
      final snapshot = await firestore
          .collection("users")
          .doc(userModel.id)
          .set(userModel.toJson());
    }
  }
}
