import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/verifycode_forget_password.dart';
import 'package:ecommerce/route/route_app.dart';
import 'package:get/get.dart';

abstract class VerifyCodeForgetPasswordController extends GetxController {
  checkcode();
  goToResetPassword(String verificationCode);
  resendVerifycode();
}

class VerifyCodeForgetPasswordControllerImp
    extends VerifyCodeForgetPasswordController {
  late String email;
  VerifyCodeForgetPasswordData verifyCode =
      VerifyCodeForgetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.success;

  @override
  goToResetPassword(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCode.postData(email, verificationCode);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.offNamed(AppRoute.resetPassword, arguments: {"email": email});
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

  @override
  resendVerifycode() {
    print(email);
    verifyCode.resendVerifycode(email);
  }
}
