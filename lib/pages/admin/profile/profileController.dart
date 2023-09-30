import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:keri_shipper/FirebaseService/ProviderUser.dart';
import 'package:keri_shipper/dialog/dialog.dart';
import 'package:keri_shipper/models/UserModel.dart';

class ProfileAdminController extends GetxController {
  Rxn<UserModel> userModel = Rxn<UserModel>();
  ProfileAdminController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var userNameController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var tenCty = TextEditingController();
  var maSoThue = TextEditingController();
  var nguoiDaiDien = TextEditingController();
  var soDienThoai = TextEditingController();
  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
  UserProvider userProvider = UserProvider();
  var thongTinThem = TextEditingController();

  var formKey = GlobalKey<FormState>();
  TextEditingController ten = TextEditingController();
  final keyWards = GlobalKey<FormFieldState>();
  final keyDistricts = GlobalKey<FormFieldState>();

  Rxn<File> file = Rxn<File>();

  @override
  void onInit() async {
    Loadata();

    super.onInit();
  }

  void resetWards() {
    keyWards.currentState!.reset();
  }

  void resetDistrict() {
    keyDistricts.currentState!.reset();
  }

  void Loadata() async {
    if (Get.arguments == null) {
      userModel.value = await userProvider.getUser();
    } else {
      String id = Get.arguments;
      userModel.value = await userProvider.getUserByID(id);
    }

    if (userModel.value != null) {
      print(userModel.value!.id!);

      emailController.text = userModel.value!.email;
      userNameController.text = userModel.value!.username;
      phoneController.text = userModel.value!.phone;
      addressController.text = userModel.value!.address;
      thongTinThem.text = userModel.value!.thongTinThem ?? "";
    }
  }

  Future UpdateUser() async {
    String urlAvatar = "";
    DiaLog.showIndicatorDialog();
    if (file.value != null) {
      final path = 'UserProfile/${FirebaseAuth.instance.currentUser!.uid}';
      final fileImage = File(file.value!.path);
      var ref = FirebaseStorage.instance.ref().child(path);
      await ref.putFile(fileImage);
      urlAvatar = (await ref.getDownloadURL()).toString();
    }

    UserModel temp = UserModel(
        userModel.value!.id,
        userNameController.text,
        userModel.value!.email,
        userModel.value!.password,
        addressController.text,
        urlAvatar,
        urlAvatar.isNotEmpty ? urlAvatar : userModel.value!.avatar_image_link,
        phoneController.text,
        true,
        userModel.value!.role,
        "",
        "",
        true,
        thongTinThem: thongTinThem.text,
        trangThai: userModel.value!.trangThai!);
    await userProvider.setUser(temp).whenComplete(() => Get.close(1));

    DiaLog.showSnackBar("Thông báo", "Lưu thành công");
  }

  Future<void> selectImages() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result == null) return;

    final path = result.files.single.path!;
    file.value = File(path);
  }
}
