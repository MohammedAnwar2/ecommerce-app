import 'package:ecommerce/controller/auth/signup/verifycode_signup_controller.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/auth/custom_otp_text_field.dart';
import 'package:ecommerce/view/widget/auth/custom_text_appbar_title_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_body_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_title_auth.dart';
import 'package:ecommerce/view/widget/auth/resend_verifycode_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          backgroundColor: AppColor.background,
          elevation: 0.0,
          centerTitle: true,
          title: CustomTextAppBarTitleAuth(text: "43".tr),
        ),
        body: GetBuilder<VerifyCodeSignUpControllerImp>(
            init: VerifyCodeSignUpControllerImp(),
            builder: (controller) {
              return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: horizontalSize(30)),
                    child: ListView(
                      padding:
                          EdgeInsetsDirectional.only(top: verticalSized(15)),
                      children: [
                        CustomTextTitleAuth(text: "27".tr),
                        verticalSizedBox(20),
                        CustomTextBodyAuth(
                            text: "${"44".tr} ${controller.email}"),
                        verticalSizedBox(20),
                        CustomOtpTextField(
                          onSubmit: (String verificationCode) {
                            controller.checkVerifyCode(verificationCode);
                          },
                        ),
                        verticalSizedBox(50),
                        ResendVerifyCodeButton(
                          onTap: () {
                            controller.resendVerifycode();
                          },
                        )
                      ],
                    ),
                  ));
            }));
  }
}
