import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/route/route_app.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  logoutApp();
}

class HomeControllerImp extends HomeController {
  late String name;
  late int id;
  late String phone;
  late String email;
  late bool logout;
  MyServices services = Get.find<MyServices>();
  init() {
    logout = false;
    name = services.sharePref.getString(AppKey.usersName)!;
    id = services.sharePref.getInt(AppKey.usersId)!;
    phone = services.sharePref.getString(AppKey.usersPhone)!;
    email = services.sharePref.getString(AppKey.usersEmail)!;
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

  @override
  logoutApp() {
    services.sharePref.setBool(AppKey.loginMiddleware, false);
    Get.offAllNamed(AppRoute.login);
  }
}
