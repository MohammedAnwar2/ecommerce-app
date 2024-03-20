import 'package:ecommerce/route/route_app.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkcode();
  goToSuccessSignUp();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  late String verifyCode;

  @override
  goToSuccessSignUp() {
    Get.toNamed(AppRoute.successSignup);
  }

  @override
  checkcode() {}

  @override
  void onInit() {
    super.onInit();
  }
}
