import 'package:ecommerce/route/route_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CheckEmailController extends GetxController {
  checkEmail();
  goToSuccessResetPassword();
}

class CheckEmailControllerImp extends CheckEmailController {
  late TextEditingController email;

  @override
  goToSuccessResetPassword() {
    Get.toNamed(AppRoute.successResetpassword);
  }

  @override
  checkEmail() {}

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
