import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/verifycode_forget_password.dart';
import 'package:ecommerce/routes/route_app.dart';
import 'package:get/get.dart';

abstract class VerifyCodeForgetPasswordController extends GetxController {
  checkVerifyCode(String verificationCode);
  resendVerifycode();
}

class VerifyCodeForgetPasswordControllerImp
    extends VerifyCodeForgetPasswordController {
  late String email;
  VerifyCodeForgetPasswordData verifyCode =
      VerifyCodeForgetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.success;

  @override
  checkVerifyCode(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCode.postData(email, verificationCode);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.offNamed(AppRoute.resetPassword, arguments: {"email": email});
      } else {
        // statusRequest = StatusRequest.nodata;
        Get.defaultDialog(title: "46".tr, middleText: "52".tr);
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  resendVerifycode() {
    verifyCode.resendVerifycode(email);
  }
}
