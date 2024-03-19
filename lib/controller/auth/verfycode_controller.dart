import 'package:ecommerce/route/route_app.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkcode();
  goToResetPassword();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  late String verifyCode;

  @override
  goToResetPassword() {
    Get.toNamed(AppRoute.resetPassword);
  }

  @override
  checkcode() {}

  @override
  void onInit() {
    super.onInit();
  }
}
