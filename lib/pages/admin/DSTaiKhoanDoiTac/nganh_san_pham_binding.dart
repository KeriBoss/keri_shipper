import 'package:get/get.dart';
import 'nganh_san_pham_controller.dart';

class DSTaiKhoanDoiTacBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DSTaiKhoanDoiTacController>(() => DSTaiKhoanDoiTacController());
  }
}
