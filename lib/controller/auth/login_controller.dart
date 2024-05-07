import 'dart:developer';

import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/data/datasource/remote/auth/login.dart';
import 'package:ecommerce/data/datasource/remote/auth/verifycode_signup.dart';
import 'package:ecommerce/routes/route_app.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
  hidePassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool showPasswordValue = true;
  IconData icon = Icons.lock_outline;
  LoginData testData = LoginData(Get.find());
  VerifyCodeSignUpData verifycodeData = VerifyCodeSignUpData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices controller = Get.find<MyServices>();

  @override
  login() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await testData.postData(email.text, password.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          if (response['data']['users_approve'] == 1) {
            controller.sharePref
                .setInt(AppKey.usersId, response['data']['users_id']);
            controller.sharePref
                .setString(AppKey.usersName, response['data']['users_name']);
            controller.sharePref
                .setString(AppKey.usersEmail, response['data']['users_email']);
            controller.sharePref
                .setString(AppKey.usersPhone, response['data']['users_phone']);
            controller.sharePref.setBool(AppKey.loginMiddleware, true);
            Get.offAllNamed(AppRoute.homeScreen);
          } else {
            print("email === ${email.text}");
            verifycodeData.resendVerifycode(email.text);
            Get.toNamed(AppRoute.verifyCodeSignUp,
                arguments: {"email": email.text});
          }
        } else {
          // statusRequest = StatusRequest.nodata;
          if (response['message'] == "password") {
            Get.defaultDialog(title: "46".tr, middleText: "54".tr);
          } else {
            Get.defaultDialog(title: "46".tr, middleText: "55".tr);
          }
        }
      }
      update();
    } else {
      print("falid");
    }
  }

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
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    setupToken();
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

  Future<void> setupToken() async {
    // Get the token each time the application loads
    String? token = await FirebaseMessaging.instance.getToken();
    log(token.toString());
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
