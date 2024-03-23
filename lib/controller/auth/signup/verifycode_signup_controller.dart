import 'package:ecommerce/route/route_app.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/verifycode_signup.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkcode();
  goToSuccessSignUp(String verificationCode);
  resendVerifycode();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerifyCodeSignUpData verifycodeData = VerifyCodeSignUpData(Get.find());
  StatusRequest statusRequest = StatusRequest.success;
  late String email;

  @override
  goToSuccessSignUp(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifycodeData.postData(email, verificationCode);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoute.successSignup);
      } else {
        // statusRequest = StatusRequest.nodata;
        Get.defaultDialog(title: "46".tr, middleText: "52".tr);
      }
    }
    update();
  }

  @override
  checkcode() {}

  @override
  void onInit() {
    email = Get.arguments['email'];
    // verifycodeData.resendVerifycode(email);
    super.onInit();
  }

  @override
  resendVerifycode() {
    print(email);
    verifycodeData.resendVerifycode(email);
  }
}
