import 'package:ecommerce/route/route_app.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
}

class LoginControllerImp extends LoginController {
  @override
  goToSignUp() {
    Get.toNamed(AppRoute.SignUp);
  }

  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }
}
