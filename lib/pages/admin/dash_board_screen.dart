import 'package:flutter/material.dart';
import 'package:keri_shipper/constants/constants.dart';
import 'package:keri_shipper/constants/responsive.dart';
import 'package:keri_shipper/pages/admin/DSTaiKhoanDoiTac/nganh_san_pham_view.dart';
import 'package:keri_shipper/pages/admin/controller.dart';
import 'package:keri_shipper/pages/admin/home/dashboard_content.dart';

import 'package:get/get.dart';
import 'home/drawer_menu.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({Key? key}) : super(key: key);
  final List<Widget> list = [
    DashboardContent(),
    DSTaiKhoanDoiTacPage(),
    Container()
  ];
  MainController mainController = Get.put(MainController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: bgColor,
          drawer: DrawerMenu(),
          key: mainController.scaffoldKey.value,
          body: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (Responsive.isDesktop(context))
                  Expanded(
                    child: DrawerMenu(),
                  ),
                Obx(() => Expanded(
                    flex: 5,
                    child: list.elementAt(mainController.index.value))),
              ],
            ),
          ),
        ));
  }
}
