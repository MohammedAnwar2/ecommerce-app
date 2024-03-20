import 'package:ecommerce/route/route_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetPasswor();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController repassword;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  goToSuccessResetPasswor() {
    Get.offAllNamed(AppRoute.successResetpassword);
  }

  @override
  resetPassword() {
    if (formKey.currentState!.validate()) {
      goToSuccessResetPasswor();
      print("success");
    } else {
      print("not valid");
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    password.dispose();
    repassword.dispose();
    super.onClose();
  }
}
