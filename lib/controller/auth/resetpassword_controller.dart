import 'package:ecommerce/route/route_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetPasswor();
  showPassword(int type);
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController repassword;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool showPasswordValue1 = true;
  bool showPasswordValue2 = true;
  IconData icon1 = Icons.lock_outline;
  IconData icon2 = Icons.lock_outline;

  @override
  showPassword(int type) {
    if (type == 1) {
      if (showPasswordValue1 != false) {
        showPasswordValue1 = false;
        icon1 = Icons.lock_open;
      } else {
        showPasswordValue1 = true;
        icon1 = Icons.lock_outline;
      }
    } else {
      if (showPasswordValue2 != false) {
        showPasswordValue2 = false;
        icon2 = Icons.lock_open;
      } else {
        showPasswordValue2 = true;
        icon2 = Icons.lock_outline;
      }
    }
    update();
  }

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
