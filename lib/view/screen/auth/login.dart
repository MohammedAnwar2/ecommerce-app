import 'package:ecommerce/controller/auth/login_controller.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/functions/alertExitApp.dart';
import 'package:ecommerce/core/functions/validation.dart';
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
          title: CustomTextAppBarTitleAuth(text: "9".tr),
        ),
        body: PopScope(
            canPop: false,
            onPopInvoked: (canPop) {
              alearExitApp();
            },
            child: GetBuilder<LoginControllerImp>(
              builder: (controller) {
                return HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: Container(
                      padding: EdgeInsetsDirectional.symmetric(
                          horizontal: horizontalSize(30)),
                      child: Form(
                        key: controller.formKey,
                        child: ListView(
                          padding: EdgeInsetsDirectional.only(
                              top: verticalSized(15)),
                          children: [
                            const LogoAuth(),
                            CustomTextTitleAuth(text: "10".tr),
                            verticalSizedBox(20),
                            CustomTextBodyAuth(text: "11".tr),
                            verticalSizedBox(20),
                            CustomTextFormFieldAuth(
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) {
                                return validationInput(
                                    val: val!, min: 5, max: 50, type: "email");
                              },
                              controller: controller.email,
                              hint: "12".tr,
                              lable: "18".tr,
                              icon: Icons.email_outlined,
                            ),
                            verticalSizedBox(20),
                            GetBuilder<LoginControllerImp>(
                              init: LoginControllerImp(),
                              builder: (controller) => CustomTextFormFieldAuth(
                                obscureText: controller.showPasswordValue,
                                onPressed: () {
                                  controller.showPassword();
                                },
                                keyboardType: TextInputType.visiblePassword,
                                validator: (val) {
                                  return validationInput(
                                      val: val!,
                                      min: 5,
                                      max: 30,
                                      type: "password");
                                },
                                controller: controller.password,
                                hint: "13".tr,
                                lable: "19".tr,
                                icon: controller.icon,
                              ),
                            ),
                            verticalSizedBox(20),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  controller.goToForgetPassword();
                                },
                                child: Text(
                                  "14".tr,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),
                            verticalSizedBox(10),
                            CustomAuthButton(
                              text: "9".tr,
                              onPressed: () {
                                controller.login();
                              },
                            ),
                            verticalSizedBox(20),
                            CustomTextSignInOrSignUp(
                                textOne: "16".tr,
                                textTwo: "17".tr,
                                onPressed: () {
                                  controller.goToSignUp();
                                })
                          ],
                        ),
                      ),
                    ));
              },
            )));
  }
}
