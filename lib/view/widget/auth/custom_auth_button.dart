import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: AppColor.primaryColor,
      textColor: AppColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsetsDirectional.symmetric(vertical: 12),
      child: Text(text),
    );
  }
}
