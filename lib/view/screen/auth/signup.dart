import 'package:ecommerce/controller/auth/signup_controller.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_imageassets.dart';
import 'package:ecommerce/core/functions/alertExitApp.dart';
import 'package:ecommerce/core/functions/validation.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/auth/custom_text_appbar_title_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_body_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_form_field_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_signIn_or_signup.dart';
import 'package:ecommerce/view/widget/auth/custom_text_title_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          backgroundColor: AppColor.background,
          elevation: 0.0,
          centerTitle: true,
          title: CustomTextAppBarTitleAuth(text: "17".tr),
        ),
        body: PopScope(
          canPop: false,
          onPopInvoked: (canPop) {
            alearExitApp();
          },
          child: GetBuilder<SignUpControllerImp>(
              init: SignUpControllerImp(),
              builder: (controller) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: horizontalSize(30)),
                    child: Form(
                      key: controller.formKey,
                      child: ListView(
                        padding:
                            EdgeInsetsDirectional.only(top: verticalSized(15)),
                        children: [
                          CustomTextTitleAuth(text: "10".tr),
                          verticalSizedBox(20),
                          CustomTextBodyAuth(text: "24".tr),
                          verticalSizedBox(20),
                          CustomTextFormFieldAuth(
                            keyboardType: TextInputType.name,
                            validator: (val) {
                              return validationInput(
                                  val: val!, min: 2, max: 50, type: "username");
                            },
                            controller: controller.userName,
                            hint: "23".tr,
                            lable: "20".tr,
                            icon: Icons.person_2_outlined,
                          ),
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
                          CustomTextFormFieldAuth(
                            keyboardType: TextInputType.phone,
                            validator: (val) {
                              return validationInput(
                                  val: val!, min: 5, max: 20, type: "phone");
                            },
                            controller: controller.phone,
                            hint: "22".tr,
                            lable: "21".tr,
                            icon: Icons.phone_android_outlined,
                          ),
                          verticalSizedBox(20),
                          GetBuilder<SignUpControllerImp>(
                            init: SignUpControllerImp(),
                            builder: (controller) => CustomTextFormFieldAuth(
                              obscureText: controller.showPasswordValue,
                              onPressed: () => controller.showPassword(),
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
                          verticalSizedBox(30),
                          CustomAuthButton(
                            text: "17".tr,
                            onPressed: () async {
                              await controller.signUp();
                            },
                          ),
                          verticalSizedBox(20),
                          CustomTextSignInOrSignUp(
                            textOne: "25".tr,
                            textTwo: "9".tr,
                            onPressed: () {
                              controller.goToLogin();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}
