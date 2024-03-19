import 'package:ecommerce/controller/auth/forgetpassword.dart';
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
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          backgroundColor: AppColor.background,
          elevation: 0.0,
          centerTitle: true,
          title: const CustomTextAppBarTitleAuth(text: "Reset Password"),
        ),
        body: Container(
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: horizontalSize(30)),
          child: ListView(
            padding: EdgeInsetsDirectional.only(top: verticalSized(15)),
            children: [
              const CustomTextTitleAuth(text: "Check Email"),
              verticalSizedBox(20),
              const CustomTextBodyAuth(
                  text:
                      "Sign up With Your Email And Password OR Continue With Social Media"),
              verticalSizedBox(20),
              CustomTextFormFieldAuth(
                controller: controller.email,
                hint: "Enter Your UserName",
                lable: "UserName",
                icon: Icons.person_2_outlined,
              ),
              verticalSizedBox(10),
              CustomAuthButton(
                text: "Sign in",
                onPressed: () {},
              ),
            ],
          ),
        ));
  }
}
