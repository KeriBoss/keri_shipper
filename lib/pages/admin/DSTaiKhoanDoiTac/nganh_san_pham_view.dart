import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keri_shipper/constants/color_palette.dart';
import 'package:keri_shipper/constants/constants.dart';
import 'package:keri_shipper/constants/responsive.dart';
import 'package:keri_shipper/dialog/dialog.dart';
import 'package:keri_shipper/models/UserModel.dart';
import 'package:keri_shipper/pages/admin/home/drawer_menu.dart';
import 'package:keri_shipper/pages/admin/profile/profilePage.dart';
import 'package:keri_shipper/provider/ProviderUser.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'nganh_san_pham_controller.dart';

class DSTaiKhoanDoiTacPage extends GetView<DSTaiKhoanDoiTacController> {
  DSTaiKhoanDoiTacPage({Key? key}) : super(key: key);
  DSTaiKhoanDoiTacController controller = Get.put(DSTaiKhoanDoiTacController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: !Responsive.isDesktop(context) ? DrawerMenu() : null,
      appBar: AppBar(title: const Text('Danh sách tài khoản')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: Get.width > 1000 ? Get.width / 2 : Get.width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controller.searchField,
                      autofillHints: controller.listSrc
                          .map((element) => element.username)
                          .toList(),
                      onChanged: (value) {
                        controller.search(value);
                      },
                      decoration: const InputDecoration(
                          hintText: 'Tìm kiếm', prefixIcon: Icon(Icons.search)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          labelText: "Loại tài khoản"),
                      isExpanded: true,
                      hint: const Text(
                        "Chọn loại tài khoản",
                      ),
                      isDense: false,
                      items: controller.listRole.map<DropdownMenuItem>((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.selectedRole.value = value!;

                        controller.search(controller.searchField.text);
                      },
                    ),
                  ),
                  Obx(() => ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: controller.list.length > 100
                            ? 100
                            : controller.list.length,
                        itemBuilder: (BuildContext context, int index) {
                          UserModel categoryModel = controller.list[index];
                          //print(baiViet.toJson());
                          return DanhMucSP(categoryModel, context);
                        },
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorPalette.primaryColor,
        onPressed: () {
          // Get.to(() => ThemUserPage());
        },
        child: const Icon(
          Icons.add,
          color: ColorPalette.whiteColor,
        ),
      ),
    );
  }

  Widget getNameRole(int role) {
    if (role == 2) {
      return const Text(
        "Loại tài khoản: Người giao hàng",
        style: TextStyle(),
        overflow: TextOverflow.ellipsis,
      );
    } else if (role == 1) {
      return const Text(
        "Loại tài khoản: Khách hàng",
        style: TextStyle(),
      );
    } else {
      return const Text("Loại tài khoản: Admin ",
          overflow: TextOverflow.ellipsis);
    }
  }

  int getRole(String str) {
    int role = 0;
    if (str == 2) {}
    return role;
  }

  Widget DanhMucSP(UserModel userModel, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: appPadding),
      padding: EdgeInsets.all(appPadding / 2),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: CachedNetworkImage(
              width: 38,
              imageUrl: userModel.avatar_image_link,
              errorWidget: (context, url, error) => Icon(Icons.image),
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: appPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userModel.username!,
                    style: TextStyle(
                        color: textColor, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    userModel.email!,
                    style: TextStyle(
                      color: textColor.withOpacity(0.5),
                      fontSize: 13,
                    ),
                  ),
                  getNameRole(userModel.role),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Địa chỉ: " + userModel.address,
                    style: TextStyle(
                      color: textColor.withOpacity(0.5),
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Số điện thoại: " + userModel.phone,
                    style: TextStyle(
                      color: textColor.withOpacity(0.5),
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Mật khẩu: " + userModel.password,
                    style: TextStyle(
                      color: textColor.withOpacity(0.5),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTapDown: (details) {
              showMenu<String>(
                context: Get.overlayContext!,
                position: RelativeRect.fromLTRB(
                  details.globalPosition.dx,
                  details.globalPosition.dy,
                  details.globalPosition.dx,
                  details.globalPosition.dy,
                ),
                items: [
                  PopupMenuItem<String>(
                    child: const Text('Xóa'),
                    value: '1',
                    onTap: (() async {
                      Future.delayed(
                        Duration.zero,
                        () async {
                          UserProvider userProvider = UserProvider();
                          final prefs = await SharedPreferences.getInstance();
                          String? email = await prefs.getString('email');
                          String? password = await prefs.getString('password');
                          DiaLog.showConfirmDialogYN(
                              title: "Thông báo",
                              content: "Bạn có chắc muốn xóa tài khoản này ?",
                              accept: () async {
                                Get.close(1);
                                await userProvider.delteUser(
                                    userModel, email, password);
                              });
                        },
                      );
                    }),
                  ),
                  PopupMenuItem<String>(
                    child: const Text('Chỉnh sửa'),
                    value: '2',
                    onTap: (() async {
                      Future.delayed(
                        Duration.zero,
                        () {
                          Get.to(() => ProfileAdminPage(),
                              arguments: userModel.id);
                        },
                      );
                    }),
                  ),
                ],
                elevation: 8.0,
              );
            },
            child: Icon(
              Icons.more_vert_rounded,
              color: textColor.withOpacity(0.5),
              size: 18,
            ),
          )
        ],
      ),
    );
  }
}
