import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keri_shipper/constants/textstyle_ext.dart';
import 'package:keri_shipper/data/dummy_data.dart';
import 'package:keri_shipper/dialog/dialog.dart';
import 'package:sizer/sizer.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: optionSettingAdmin.length,
            itemBuilder: (context, index) {
              return moreListTile(
                icon: optionSettingAdmin[index]['icon'],
                title: optionSettingAdmin[index]['title'],
                url: optionSettingAdmin[index]['screenLink'],
              );
            },
          )
        ],
      ),
    );
  }

  Widget moreListTile(
      {required IconData icon,
      required String title,
      String? url,
      Function? onTap}) {
    return Card(
      elevation: 0,
      child: ListTile(
        dense: true,
        //visualDensity: VisualDensity.compact,
        onTap: () async {
          if (url == "/logout") {
            DiaLog.showConfirmDialogYN(
                title: "Thông báo",
                content: "Bạn có muốn thoát không!!!",
                accept: () async {
                  await FirebaseAuth.instance.signOut();
                  Get.offAllNamed("/login");
                });
          } else {
            if (url != null) {
              Get.toNamed(url);
            }
          }
        },
        minLeadingWidth: 4.w,
        leading: Icon(icon),
        title: Text(
          title,
          style: TextStyles.defaultStyle,
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
