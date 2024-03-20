import 'package:ecommerce/route/route_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
  showPassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
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
  goToSignUp() {
    Get.toNamed(AppRoute.signUp);
  }

  @override
  login() {
    if (formKey.currentState!.validate()) {
      print("success");
    } else {
      print("falid");
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  //@override
  // void onClose() {
  //   email.dispose();
  //   password.dispose();
  //   super.onClose();
  // }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
