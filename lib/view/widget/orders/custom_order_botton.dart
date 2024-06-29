import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';

class CustomOrderButtom extends StatelessWidget {
  const CustomOrderButtom(
      {super.key, required this.onPressed, required this.text});
  final void Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero, // Removes the default padding
      materialTapTargetSize:
          MaterialTapTargetSize.shrinkWrap, // Shrinks the tap target
      minWidth: horizontalSize(60), // Minimum width
      height: verticalSized(30),
      color: AppColor.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: AppColor.white,
          fontWeight: FontWeight.bold,
          fontSize: fontSize(12),
        ),
      ),
    );
  }
}
