import 'package:ecommerce/controller/auth/resetpassword_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
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
          title: const CustomTextAppBarTitleAuth(text: "ResetPassword"),
        ),
        body: Container(
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: horizontalSize(30)),
          child: ListView(
            padding: EdgeInsetsDirectional.only(top: verticalSized(15)),
            children: [
              const CustomTextTitleAuth(text: "New Password"),
              verticalSizedBox(15),
              const CustomTextBodyAuth(text: "Please Enter New Password"),
              verticalSizedBox(10),
              CustomTextFormFieldAuth(
                controller: controller.password,
                hint: "Enter Your Password",
                lable: "Password",
                icon: Icons.lock_outlined,
              ),
              verticalSizedBox(20),
              CustomTextFormFieldAuth(
                controller: controller.repassword,
                hint: "Re Enter Your Password",
                lable: "RePassword",
                icon: Icons.lock_outlined,
              ),
              verticalSizedBox(25),
              CustomAuthButton(
                text: "Save",
                onPressed: () {
                  controller.goToSuccessResetPasswor();
                },
              ),
            ],
          ),
        ));
  }
}
