import 'package:get/get.dart';
import 'home_driver_controller.dart';

class HomeDriverBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<HomeDriverController>(() => HomeDriverController());
    }
}
