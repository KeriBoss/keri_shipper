import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:keri_shipper/dialog/dialog.dart';
import 'package:keri_shipper/pages/admin/controller.dart';
import 'package:flutter/material.dart';
import 'package:keri_shipper/constants/constants.dart';

import 'package:get/get.dart';
import 'package:keri_shipper/pages/admin/components/drawer_list_tile.dart';

class DrawerMenu extends StatelessWidget {
  DrawerMenu({Key? key}) : super(key: key);
  MainController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(appPadding),
            child: Image.asset("assets/images/logowithtext.png"),
          ),
          DrawerListTile(
              title: 'Dash Board',
              svgSrc: 'assets/icons/Dashboard.svg',
              tap: () {
                controller.setIndexPage(0);
              }),
          DrawerListTile(
              title: 'Danh sách tài khoản',
              svgSrc: 'assets/icons/BlogPost.svg',
              tap: () {
                controller.setIndexPage(1);
              }),
          DrawerListTile(
              title: 'Hộp thư',
              svgSrc: 'assets/icons/Message.svg',
              tap: () {
                controller.setIndexPage(2);
              }),
          DrawerListTile(
              title: 'Thống kê',
              svgSrc: 'assets/icons/Statistics.svg',
              tap: () {}),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: appPadding * 2),
            child: Divider(
              color: grey,
              thickness: 0.2,
            ),
          ),
          DrawerListTile(
              title: 'Cài đặt', svgSrc: 'assets/icons/Setting.svg', tap: () {}),
          DrawerListTile(
              title: 'Đăng xuất',
              svgSrc: 'assets/icons/Logout.svg',
              tap: () async {
                DiaLog.showConfirmDialogYN(
                    title: "Thông báo",
                    content: "Bạn có muốn thoát không?",
                    accept: () async {
                      await FirebaseAuth.instance.signOut();
                      Get.offAllNamed("/login");
                    });
              })
        ],
      ),
    );
  }
}
