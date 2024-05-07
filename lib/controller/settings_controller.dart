import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/routes/route_app.dart';
import 'package:get/get.dart';

abstract class SettingsController extends GetxController {
  logout();
  goToAddress();
}

class SettingsControllerImp extends SettingsController {
  MyServices services = Get.find<MyServices>();
  @override
  logout() {
    services.sharePref.setBool(AppKey.loginMiddleware, false);
    Get.toNamed(AppRoute.login);
  }

  @override
  goToAddress() {
    Get.toNamed(AppRoute.viewAddress);
  }
}
