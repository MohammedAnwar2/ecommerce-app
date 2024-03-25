import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/signup.dart';
import 'package:ecommerce/route/route_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToLogin();
  hidePassword();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  late TextEditingController userName;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool showPasswordValue = true;
  IconData icon = Icons.lock_outline;

  //TestData testData = TestData(Crud());
  SignupData testData = SignupData(Get.find());
  StatusRequest statusRequest = StatusRequest.success;

  @override
  hidePassword() {
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
  signUp() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await testData.postData(
          userName.text, email.text, phone.text, password.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          //  data.addAll(response['data']);
          Get.toNamed(AppRoute.verifyCodeSignUp,
              arguments: {"email": email.text});
        } else {
          // statusRequest = StatusRequest.nodata;
          Get.defaultDialog(title: "46".tr, middleText: "53".tr);
        }
      }
      update();
    } else {
      print("not vaild");
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
