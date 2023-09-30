import 'dart:io';
import 'dart:math';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:keri_shipper/constants/color_constants.dart';
import 'package:keri_shipper/dialog/dialog.dart';
import 'package:keri_shipper/pages/admin/profile/profileController.dart';

import '../../../constants/color_palette.dart';
import '../../../validate/validate.dart';

class ProfileAdminPage extends StatefulWidget {
  const ProfileAdminPage({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfileAdminPage>
    with SingleTickerProviderStateMixin {
  final f = new DateFormat('dd-MM-yyyy');
  final keyWards = GlobalKey<FormFieldState>();
  final keyDistricts = GlobalKey<FormFieldState>();
  final wardsController = TextEditingController();
  final nameHouseController = TextEditingController();
  final nameStreetController = TextEditingController();
  ProfileAdminController profileController = Get.put(ProfileAdminController());
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
              title: const Text('Thông tin tài khoản'),
              pinned: true,
              floating: false,
              forceElevated: innerBoxIsScrolled,
              elevation: 0.1),
        ];
      },
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 160.0,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Stack(fit: StackFit.loose, children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Obx(() => ClipOval(
                                    child: Container(
                                        child: profileController.file.value !=
                                                null
                                            ? Image.file(
                                                File(profileController
                                                    .file.value!.path),
                                                fit: BoxFit.cover,
                                              )
                                            : profileController
                                                            .userModel.value !=
                                                        null &&
                                                    profileController
                                                            .userModel
                                                            .value!
                                                            .avatar_image_link !=
                                                        ""
                                                ? CachedNetworkImage(
                                                    imageUrl: profileController
                                                        .userModel
                                                        .value!
                                                        .avatar_image_link,
                                                    fit: BoxFit.cover,
                                                    width: 140.0,
                                                    height: 140.0,
                                                  )
                                                : Image.asset(
                                                    'assets/images/ic_user.png'),
                                        width: 140.0,
                                        height: 140.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        )),
                                  ))
                            ],
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 90.0, right: 100.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  _status == false
                                      ? InkWell(
                                          onTap: () {
                                            profileController.selectImages();
                                          },
                                          child: const CircleAvatar(
                                            backgroundColor:
                                                ColorPalette.primaryColor,
                                            radius: 25.0,
                                            child: Icon(
                                              Icons.camera_alt,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      : Container()
                                ],
                              )),
                        ]),
                      )
                    ],
                  ),
                ),
                Form(
                  key: profileController.formKey,
                  child: Container(
                    color: const Color(0xffFFFFFF),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const <Widget>[
                                      Text(
                                        'Thông tin',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      _status ? _getEditIcon() : Container(),
                                    ],
                                  )
                                ],
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Flexible(
                                    child: TextFormField(
                                      controller:
                                          profileController.userNameController,
                                      decoration: const InputDecoration(
                                          label: const Text('Tên ')),
                                      enabled: !_status,
                                      autofocus: !_status,
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Flexible(
                                    child: TextFormField(
                                      enabled: false,
                                      controller:
                                          profileController.emailController,
                                      decoration: const InputDecoration(
                                          label: const Text('Email ')),
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Flexible(
                                    child: TextFormField(
                                      controller:
                                          profileController.addressController,
                                      decoration: const InputDecoration(
                                          label: const Text('Địa chỉ')),
                                      enabled: !_status,
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Flexible(
                                    child: TextFormField(
                                      controller:
                                          profileController.phoneController,
                                      decoration: const InputDecoration(
                                          label: const Text('Số điện thoại ')),
                                      enabled: !_status,
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 2.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(
                                        controller:
                                            profileController.thongTinThem,
                                        decoration: const InputDecoration(
                                            label:
                                                const Text('Thông tin thêm ')),
                                        enabled: !_status,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Obx(() => profileController.userModel.value != null &&
                                  profileController.userModel.value!.role == 2
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('Ảnh CMND mặt trước '),
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: CachedNetworkImage(
                                            imageUrl: profileController
                                                .userModel.value!.cMNDSau!),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text('Ảnh CMND mặt sau '),
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: CachedNetworkImage(
                                            imageUrl: profileController
                                                .userModel.value!.cMNDTruoc!),
                                      ),
                                      Text('Ảnh xe '),
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: CachedNetworkImage(
                                            imageUrl: profileController
                                                .userModel.value!.anhXe!),
                                      ),
                                      if (profileController
                                              .userModel.value!.trangThai ==
                                          "Chờ xác nhận")
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: ElevatedButton(
                                            child: Text('Kích hoạt tài khoản')
                                                .textColor(Colors.white),
                                            onPressed: () async {
                                              profileController.userModel.value!
                                                  .trangThai = "Đã kích hoạt";
                                              DiaLog.showConfirmDialogYN(
                                                  title: "Thông báo",
                                                  content:
                                                      "Bạn có chắc muốn kích hoạt tài khoản người giao hàng này ?",
                                                  accept: () async {
                                                    Get.close(2);
                                                    await profileController
                                                        .userProvider
                                                        .setUser(
                                                            profileController
                                                                .userModel
                                                                .value!);
                                                  });
                                            },
                                          ),
                                        ),
                                    ],
                                  ),
                                )
                              : Container()),
                          Divider(),
                          !_status ? _getActionButtons() : Container(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                _status = true;
              });
            },
            child: InkWell(
              onTap: () {
                profileController.UpdateUser();
              },
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    color: ColorPalette.primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  'Lưu',
                  style: TextStyle(
                      color: ColorPalette.whiteColor,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              setState(() {
                _status = true;
              });
            },
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorConstants.blackShade,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: Text(
                'Hủy',
                style: TextStyle(
                    color: ColorConstants.blackShade,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return GestureDetector(
      child: const CircleAvatar(
        backgroundColor: ColorPalette.primaryColor,
        radius: 14.0,
        child: Icon(
          Icons.edit,
          color: ColorConstants.whiteColor,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
