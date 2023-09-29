import 'package:get/get.dart';
import 'transport_controller.dart';

class TransportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransportController());
  }
}
