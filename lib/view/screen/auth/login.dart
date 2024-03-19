import 'package:ecommerce/controller/auth/login_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/auth/custom_text_appbar_title_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_body_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_form_field_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_signIn_or_signup.dart';
import 'package:ecommerce/view/widget/auth/custom_text_title_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_auth_button.dart';
import 'package:ecommerce/view/widget/auth/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          backgroundColor: AppColor.background,
          elevation: 0.0,
          centerTitle: true,
          title: const CustomTextAppBarTitleAuth(text: "Sign In"),
        ),
        body: Container(
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: horizontalSize(30)),
          child: ListView(
            padding: EdgeInsetsDirectional.only(top: verticalSized(15)),
            children: [
              const LogoAuth(),
              const CustomTextTitleAuth(text: "Welcome Back"),
              verticalSizedBox(20),
              const CustomTextBodyAuth(
                  text:
                      "Sign In With Your Email And Password OR Continue With Social Media"),
              verticalSizedBox(20),
              CustomTextFormFieldAuth(
                controller: controller.email,
                hint: "Enter Your Email",
                lable: "Email",
                icon: Icons.email_outlined,
              ),
              verticalSizedBox(20),
              CustomTextFormFieldAuth(
                controller: controller.password,
                hint: "Enter Your Password",
                lable: "Password",
                icon: Icons.lock_outlined,
              ),
              verticalSizedBox(20),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    controller.goToForgetPassword();
                  },
                  child: Text(
                    "Forget Password",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              verticalSizedBox(10),
              CustomAuthButton(
                text: "Sign in",
                onPressed: () {},
              ),
              verticalSizedBox(20),
              CustomTextSignInOrSignUp(
                  textOne: "Don't have an account ? ",
                  textTwo: "Sign in",
                  onPressed: () {
                    controller.goToSignUp();
                  })
            ],
          ),
        ));
  }
}
