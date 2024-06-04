import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/routes/route_app.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

abstract class SettingsController extends GetxController {
  logout();
  goToAddress();
  goToOrdersPending();
  goToOrdersArchive();
}

class SettingsControllerImp extends SettingsController {
  MyServices services = Get.find<MyServices>();
  @override
  logout() {
    services.sharePref.setBool(AppKey.loginMiddleware, false);
    var id = services.sharePref.getInt(AppKey.usersId);
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$id");
    Get.toNamed(AppRoute.login);
  }

  @override
  goToAddress() {
    Get.toNamed(AppRoute.viewAddress);
  }

  @override
  goToOrdersArchive() {
    Get.toNamed(AppRoute.archiveorders);
  }

  @override
  goToOrdersPending() {
    Get.toNamed(AppRoute.pendingorders);
  }
}
