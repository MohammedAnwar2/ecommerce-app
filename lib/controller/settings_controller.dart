import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/route/route_app.dart';
import 'package:get/get.dart';

abstract class SettingsController extends GetxController {
  logout();
}

class SettingsControllerImp extends SettingsController {
  MyServices services = Get.find<MyServices>();
  @override
  logout() {
    services.sharePref.clear();
    Get.toNamed(AppRoute.login);
  }
}
