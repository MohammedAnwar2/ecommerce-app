import 'package:ecommerce/controller/auth/forgetpassword/forgetpassword_controller.dart';
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

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          backgroundColor: AppColor.background,
          elevation: 0.0,
          centerTitle: true,
          title: CustomTextAppBarTitleAuth(text: "14".tr),
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
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
                          EdgeInsetsDirectional.only(top: verticalSized(30)),
                      children: [
                        CustomTextTitleAuth(text: "27".tr),
                        verticalSizedBox(20),
                        CustomTextBodyAuth(text: "29".tr),
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
                        verticalSizedBox(25),
                        CustomAuthButton(
                          text: "30".tr,
                          onPressed: () {
                            controller.checkEmail();
                            //controller.goToVerifyCode();
                          },
                        ),
                      ],
                    ),
                  ),
                ));
          },
        ));
  }
}
