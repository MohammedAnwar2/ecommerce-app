import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/reset_password.dart';
import 'package:ecommerce/routes/route_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  hidePassword(int type);
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController repassword;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool showPasswordValue1 = true;
  bool showPasswordValue2 = true;
  IconData icon1 = Icons.lock_outline;
  IconData icon2 = Icons.lock_outline;
  RessetPasswordData resetpassword = RessetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.success;
  late String email;
  @override
  hidePassword(int type) {
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
  resetPassword() async {
    if (formKey.currentState!.validate()) {
      if (password.text == repassword.text) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await resetpassword.postData(password.text, email);
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response['status'] == 'success') {
            Get.offAllNamed(AppRoute.successResetpassword);
          } else {
            // statusRequest = StatusRequest.nodata;
            Get.defaultDialog(title: "46".tr, middleText: "50".tr);
          }
        }
        update();
        print("success");
      } else {
        Get.defaultDialog(title: "46".tr, middleText: "51".tr);
      }
    }
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
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
