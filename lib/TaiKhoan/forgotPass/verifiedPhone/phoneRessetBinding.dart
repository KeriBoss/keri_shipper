import 'package:get/get.dart';
import 'package:keri_shipper/TaiKhoan/forgotPass/verifiedPhone/phoneRessetController.dart';

class PhoneResetBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifiedPhoneRessetController>(
        () => VerifiedPhoneRessetController());
  }
}
