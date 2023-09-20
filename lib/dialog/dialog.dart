import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiaLog {
  static showIndicatorDialog() {
    Get.dialog(
      barrierDismissible: false,
      WillPopScope(
        onWillPop: () async => false,
        child: const Center(
          child: SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              )),
        ),
      ),
    );
  }

  static showSnackBar(String title, String content) {
    Get.snackbar(title, content,
        colorText: Colors.black, backgroundColor: Colors.white);
  }

  static showCofirmDialog(String title, String content,
      {exit, String? textbutton}) {
    Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            child: Text(textbutton ?? "Đóng"),
            onPressed: () {
              if (exit != null) {
                exit();
              } else {
                Get.back();
                Get.back();
              }
            },
          )
        ],
      ),
      barrierDismissible: false,
    );
  }

  static showConfirmDialogYN(
      {required String title,
      required String content,
      required Function accept,
      barrierDismissible = false,
      dissableBack = false}) {
    if (dissableBack == true) {
      Get.dialog(
        barrierDismissible: barrierDismissible,
        WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              const SizedBox(
                width: 10,
              ),
              TextButton(
                child: const Text("Đồng ý"),
                onPressed: () {
                  accept();
                },
              )
            ],
          ),
        ),
      );
    } else {
      Get.dialog(
        barrierDismissible: barrierDismissible,
        AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Đóng",
                style: TextStyle(fontSize: 15),
              ),
              onPressed: () {
                Get.back();
              },
            ),
            const SizedBox(
              width: 10,
            ),
            TextButton(
              child: const Text(
                "Đồng ý",
                style: TextStyle(fontSize: 15),
              ),
              onPressed: () {
                accept();
              },
            )
          ],
        ),
      );
    }
  }
}
