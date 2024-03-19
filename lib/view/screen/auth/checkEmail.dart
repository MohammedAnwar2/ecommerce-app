import 'package:ecommerce/controller/auth/checkEmail_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/auth/custom_text_appbar_title_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_body_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_form_field_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_title_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    CheckEmailControllerImp controller = Get.put(CheckEmailControllerImp());
    return Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          backgroundColor: AppColor.background,
          elevation: 0.0,
          centerTitle: true,
          title: const CustomTextAppBarTitleAuth(text: "Check Email"),
        ),
        body: Container(
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: horizontalSize(30)),
          child: ListView(
            padding: EdgeInsetsDirectional.only(top: verticalSized(30)),
            children: [
              const CustomTextTitleAuth(text: "Check Email"),
              verticalSizedBox(20),
              const CustomTextBodyAuth(
                  text:
                      "Please Enter Your Email Address To Recive A Verification Code"),
              verticalSizedBox(20),
              CustomTextFormFieldAuth(
                controller: controller.email,
                hint: "Enter Your Email",
                lable: "Email",
                icon: Icons.email_outlined,
              ),
              verticalSizedBox(25),
              CustomAuthButton(
                text: "Check",
                onPressed: () {
                  controller.goToSuccessResetPassword();
                },
              ),
            ],
          ),
        ));
  }
}
