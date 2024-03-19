import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/auth/CustomTextAppBarTitleAuth.dart';
import 'package:ecommerce/view/widget/auth/CustomTextBodyAuth.dart';
import 'package:ecommerce/view/widget/auth/CustomTextFormFieldAuth.dart';
import 'package:ecommerce/view/widget/auth/CustomTextTitleAuth.dart';
import 'package:ecommerce/view/widget/auth/customAuthButton.dart';
import 'package:ecommerce/view/widget/auth/logo.dart';
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
            padding: EdgeInsetsDirectional.only(top: verticalSized(15)),
            children: [
              const LogoAuth(),
              const CustomTextTitleAuth(text: "Welcome Back"),
              verticalSizedBox(20),
              const CustomTextBodyAuth(
                  text:
                      "Sign in with your email and password or continue with social media"),
              verticalSizedBox(20),
              const CustomTextFormFieldAuth(
                hint: "Enter Your Email",
                lable: "Email",
                icon: Icons.email_outlined,
              ),
              verticalSizedBox(20),
              const CustomTextFormFieldAuth(
                hint: "Enter Your Password",
                lable: "Password",
                icon: Icons.lock_outlined,
              ),
              verticalSizedBox(20),
              Text(
                "Forget Password",
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              verticalSizedBox(10),
              CustomAuthButton(
                text: "Sign in",
                onPressed: () {},
              ),
              verticalSizedBox(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account ? ",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign in",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColor.primaryColor),
                      ))
                ],
              )
            ],
          ),
        ));
  }
}
