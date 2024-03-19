import 'package:ecommerce/route/route_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;

  @override
  goToSignUp() {
    Get.toNamed(AppRoute.SignUp);
  }

  @override
  login() {}

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
