import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';

class CustomCouponButton extends StatelessWidget {
  const CustomCouponButton({
    super.key,
    this.onCoupon,
    required this.text,
  });
  final void Function()? onCoupon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.symmetric(vertical: verticalSized(5)),
      onPressed: onCoupon,
      color: AppColor.primaryColor,
      child: Text(text, style: Theme.of(context).textTheme.displaySmall),
    );
  }
}
