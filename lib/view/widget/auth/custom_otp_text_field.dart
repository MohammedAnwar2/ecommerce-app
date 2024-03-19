import 'package:ecommerce/controller/auth/verfycode_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class CustomOtpTextField extends GetView<VerifyCodeControllerImp> {
  const CustomOtpTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      fieldWidth: 50,
      borderRadius: BorderRadius.circular(12),
      numberOfFields: 5,
      borderColor: Color(0xFF512DA8),
      //set to true to show as box or false to show as dash
      showFieldAsBox: true,
      //runs when a code is typed in
      onCodeChanged: (String code) {
        //handle validation or checks here
      },
      //runs when every textfield is filled
      onSubmit: (String verificationCode) {
        controller.goToResetPassword();
      }, // end onSubmit
    );
  }
}
