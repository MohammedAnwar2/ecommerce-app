import 'package:ecommerce/routes/route_app.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  gotoLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  gotoLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
