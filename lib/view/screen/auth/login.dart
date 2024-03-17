import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/auth/CustomTextAppBarTitleAuth.dart';
import 'package:ecommerce/view/widget/auth/CustomTextBodyAuth.dart';
import 'package:ecommerce/view/widget/auth/CustomTextFormFieldAuth.dart';
import 'package:ecommerce/view/widget/auth/CustomTextTitleAuth.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
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
            padding: EdgeInsetsDirectional.only(top: verticalSized(40)),
            children: [
              const CustomTextTitleAuth(text: "Welcome Back"),
              verticalSizedBox(15),
              const CustomTextBodyAuth(
                  text:
                      "Sign in with your email and password or continue with social media"),
              verticalSizedBox(65),
              const CustomTextFormFieldAuth(
                hint: "Enter Your Email",
                lable: "Email",
                icon: Icons.email_outlined,
              ),
              verticalSizedBox(25),
              const CustomTextFormFieldAuth(
                hint: "Enter Your Password",
                lable: "Password",
                icon: Icons.lock_outlined,
              )
            ],
          ),
        ));
  }
}
