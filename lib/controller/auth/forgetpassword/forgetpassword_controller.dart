import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/checl_email.dart';
import 'package:ecommerce/routes/route_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CheckEmailData checkemail = CheckEmailData(Get.find());
  StatusRequest statusRequest = StatusRequest.success;

  @override
  checkEmail() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkemail.postData(
        email.text,
      );
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.toNamed(AppRoute.verifyCodeForgetPassword,
              arguments: {"email": email.text});
        } else {
          // statusRequest = StatusRequest.nodata;
          Get.defaultDialog(title: "46".tr, middleText: "49".tr);
        }
      }
      update();
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
