import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'home_page_controller.dart';

class HomePagePage extends GetView<HomePageController> {
  const HomePagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        PanaraConfirmDialog.show(
          context,
          title: "Thông báo",
          message: "Bạn có muốn thoát ?",
          cancelButtonText: "Không",
          noImage: true,
          confirmButtonText: "Có", onTapCancel: () => Get.close(1),
          onTapConfirm: () {
            Get.offAllNamed("login");
          },

          panaraDialogType: PanaraDialogType.warning,
          barrierDismissible: false, // optional parameter (default is true)
        );
        return Future(() => true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          automaticallyImplyLeading: false,
        ),
        body: Container(),
      ),
    );
  }
}
