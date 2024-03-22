import 'package:ecommerce/route/route_app.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/verifycode_signup.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkcode();
  goToSuccessSignUp(String verificationCode);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerifyCodeSignUpData testData = VerifyCodeSignUpData(Get.find());
  StatusRequest statusRequest = StatusRequest.success;
  late String email;

  @override
  goToSuccessSignUp(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await testData.postData(email, verificationCode);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.offNamed(AppRoute.successSignup);
      } else {
        // statusRequest = StatusRequest.nodata;
        Get.defaultDialog(title: "Warning", middleText: response['message']);
      }
    }
    update();
  }

  @override
  checkcode() {}

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
