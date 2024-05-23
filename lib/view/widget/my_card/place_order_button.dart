import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPlaceOrderButton extends StatelessWidget {
  const CustomPlaceOrderButton({
    super.key,
    this.onPlaceOrder,
    required this.text,
  });
  final void Function()? onPlaceOrder;
  final String text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding:
          EdgeInsets.symmetric(horizontal: Get.width / 3 - horizontalSize(10)),
      onPressed: onPlaceOrder,
      color: AppColor.primaryColor,
      child: Text(text, style: Theme.of(context).textTheme.displaySmall),
    );
  }
}
