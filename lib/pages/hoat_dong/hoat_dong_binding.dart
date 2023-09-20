import 'package:get/get.dart';
import 'hoat_dong_controller.dart';

class HoatDongBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<HoatDongController>(() => HoatDongController());
    }
}
