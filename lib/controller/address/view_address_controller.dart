import 'package:ecommerce/route/route_app.dart';
import 'package:get/get.dart';

abstract class ViewAddressController extends GetxController {
  goToAddAddress();
}

class ViewAddressControllerIma extends ViewAddressController {
  @override
  goToAddAddress() {
    Get.toNamed(AppRoute.addAddress);
  }
}
