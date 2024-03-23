import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class CustomOtpTextField extends StatelessWidget {
  const CustomOtpTextField({
    super.key,
    this.onSubmit,
  });
  final void Function(String)? onSubmit;
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
        // controller.onCodeChanged(code);
        //handle validation or checks here
      },
      //runs when every textfield is filled
      onSubmit: onSubmit, // end onSubmit
    );
  }
}
