import 'package:get/get.dart';
import 'package:keri_shipper/constants/color_constants.dart';
import 'package:keri_shipper/constants/color_constants.dart';

class Snack {
  static void show(title, content) {
    Get.snackbar(
      title,
      content,
      backgroundColor: ColorConstants.whiteColor,
      colorText: ColorConstants.blackColor,
    );
  }
}
