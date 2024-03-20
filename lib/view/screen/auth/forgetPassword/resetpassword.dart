import 'package:ecommerce/controller/auth/resetpassword_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/validation.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/auth/custom_text_appbar_title_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_body_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_form_field_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_title_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          backgroundColor: AppColor.background,
          elevation: 0.0,
          centerTitle: true,
          title: CustomTextAppBarTitleAuth(text: "35".tr),
        ),
        body: Container(
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: horizontalSize(30)),
          child: Form(
            key: controller.formKey,
            child: ListView(
              padding: EdgeInsetsDirectional.only(top: verticalSized(15)),
              children: [
                CustomTextTitleAuth(text: "35".tr),
                verticalSizedBox(15),
                CustomTextBodyAuth(text: "34".tr),
                verticalSizedBox(10),
                CustomTextFormFieldAuth(
                  keyboardType: TextInputType.visiblePassword,
                  validator: (val) {
                    return validationInput(
                        val: val!, min: 5, max: 30, type: "password");
                  },
                  controller: controller.password,
                  hint: "13".tr,
                  lable: "19".tr,
                  icon: Icons.lock_outlined,
                ),
                verticalSizedBox(20),
                CustomTextFormFieldAuth(
                  keyboardType: TextInputType.visiblePassword,
                  validator: (val) {
                    return validationInput(
                        val: val!, min: 5, max: 30, type: "password");
                  },
                  controller: controller.repassword,
                  hint: "41".tr,
                  lable: "42".tr,
                  icon: Icons.lock_outlined,
                ),
                verticalSizedBox(25),
                CustomAuthButton(
                  text: "33".tr,
                  onPressed: () {
                    //controller.goToSuccessResetPasswor();
                    controller.resetPassword();
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
