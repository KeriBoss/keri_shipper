import 'package:get/get.dart';
import 'package:keri_shipper/pages/admin/controller.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController(), permanent: true);
  }
}
