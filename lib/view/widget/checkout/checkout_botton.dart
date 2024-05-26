import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';

class CheckoutBotton extends StatelessWidget {
  const CheckoutBotton({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalSize(120), vertical: verticalSized(5)),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: AppColor.secondaryColor,
        onPressed: onPressed,
        child: const Text(
          "Checkout",
          style: TextStyle(color: AppColor.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
