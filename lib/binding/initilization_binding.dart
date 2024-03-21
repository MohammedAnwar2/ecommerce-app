import 'package:ecommerce/core/class/crud.dart';
import 'package:get/get.dart';

class MyPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
