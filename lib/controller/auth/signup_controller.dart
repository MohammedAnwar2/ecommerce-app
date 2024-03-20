import 'package:ecommerce/route/route_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToLogin();
  showPassword();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  late TextEditingController userName;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool showPasswordValue = true;
  IconData icon = Icons.lock_outline;

  @override
  showPassword() {
    if (showPasswordValue == false) {
      showPasswordValue = true;
      icon = Icons.lock_outline;
    } else {
      showPasswordValue = false;
      icon = Icons.lock_open;
    }
    update();
  }

  @override
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }

  @override
  signUp() {
    if (formKey.currentState!.validate()) {
      Get.offNamed(AppRoute.verifyCodeSignUp);
    } else {
      print("vaild");
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    userName = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    phone.dispose();
    userName.dispose();
    super.onClose();
  }
}
