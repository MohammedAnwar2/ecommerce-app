import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';

class CustomAddressButton extends StatelessWidget {
  const CustomAddressButton({
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
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsetsDirectional.symmetric(
        vertical: verticalSized(6),
        horizontal: horizontalSize(130),
      ),
      child: Text(text, style: Theme.of(context).textTheme.displaySmall),
    );
  }
}
