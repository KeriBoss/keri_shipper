import 'package:get/get.dart';
import 'package:get/get.dart';

class TagController extends GetxController {
  TagController();

  @override
  void onInit() {
    super.onInit();
  }

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}
