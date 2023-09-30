import 'package:flutter/material.dart';
import 'package:keri_shipper/constants/constants.dart';
import 'package:keri_shipper/constants/responsive.dart';
import 'package:keri_shipper/pages/admin/controller.dart';
import 'package:keri_shipper/pages/admin/components/profile_info.dart';
import 'package:keri_shipper/pages/admin/components/search_field.dart';

import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget {
  CustomAppbar({Key? key}) : super(key: key);
  MainController mainController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            onPressed: mainController.controlMenu,
            icon: Icon(
              Icons.menu,
              color: textColor.withOpacity(0.5),
            ),
          ),
        Expanded(child: SearchField()),
        ProfileInfo()
      ],
    );
  }
}
