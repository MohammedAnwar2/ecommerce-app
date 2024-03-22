import 'package:ecommerce/controller/auth/forgetpassword/verfycode_forgetpassword_controller.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/auth/custom_text_appbar_title_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_body_auth.dart';
import 'package:ecommerce/view/widget/auth/custom_text_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodeForgetPassword extends StatelessWidget {
  const VerifyCodeForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeForgetPasswordControllerImp());
    return Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          backgroundColor: AppColor.background,
          elevation: 0.0,
          centerTitle: true,
          title: CustomTextAppBarTitleAuth(text: "43".tr),
        ),
        body: GetBuilder<VerifyCodeForgetPasswordControllerImp>(
            builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: horizontalSize(30)),
                child: ListView(
                  padding: EdgeInsetsDirectional.only(top: verticalSized(15)),
                  children: [
                    CustomTextTitleAuth(text: "27".tr),
                    verticalSizedBox(20),
                    CustomTextBodyAuth(text: "${"44".tr}${controller.email}"),
                    verticalSizedBox(20),
                    OtpTextField(
                      fieldWidth: 50,
                      borderRadius: BorderRadius.circular(12),
                      numberOfFields: 5,
                      borderColor: Color(0xFF512DA8),
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        // controller.onCodeChanged(code);
                        //handle validation or checks here
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {
                        controller.goToResetPassword(verificationCode);
                      }, // end onSubmit
                    )
                  ],
                ),
              ));
        }));
  }
}
