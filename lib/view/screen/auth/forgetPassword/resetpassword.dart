import 'package:ecommerce/controller/auth/forgetpassword/resetpassword_controller.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/core/constant/app_color.dart';
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
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          backgroundColor: AppColor.background,
          elevation: 0.0,
          centerTitle: true,
          title: CustomTextAppBarTitleAuth(text: "35".tr),
        ),
        body: GetBuilder<ResetPasswordControllerImp>(builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: horizontalSize(30)),
                child: Form(
                  key: controller.formKey,
                  child: ListView(
                    padding: EdgeInsetsDirectional.only(top: verticalSized(15)),
                    children: [
                      CustomTextTitleAuth(text: "35".tr),
                      verticalSizedBox(15),
                      CustomTextBodyAuth(text: "34".tr),
                      verticalSizedBox(10),
                      GetBuilder<ResetPasswordControllerImp>(
                        init: ResetPasswordControllerImp(),
                        builder: (controller) => CustomTextFormFieldAuth(
                          obscureText: controller.showPasswordValue1,
                          onPressed: () => controller.hidePassword(1),
                          keyboardType: TextInputType.visiblePassword,
                          validator: (val) {
                            return validationInput(
                                val: val!, min: 5, max: 30, type: "password");
                          },
                          controller: controller.password,
                          hint: "13".tr,
                          lable: "19".tr,
                          icon: controller.icon1,
                        ),
                      ),
                      verticalSizedBox(20),
                      GetBuilder<ResetPasswordControllerImp>(
                        init: ResetPasswordControllerImp(),
                        builder: (controller) => CustomTextFormFieldAuth(
                          onPressed: () => controller.hidePassword(2),
                          obscureText: controller.showPasswordValue2,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (val) {
                            return validationInput(
                                val: val!, min: 5, max: 30, type: "password");
                          },
                          controller: controller.repassword,
                          hint: "41".tr,
                          lable: "42".tr,
                          icon: controller.icon2,
                        ),
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
        }));
  }
}
