import 'package:ecommerce/route/route_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
  goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  goToVerifyCode() {
    Get.toNamed(AppRoute.verifyCode);
  }

  @override
  checkEmail() {
    if (formKey.currentState!.validate()) {
      print("success");
      goToVerifyCode();
    } else {
      print("not valid");
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    super.onClose();
  }
}
