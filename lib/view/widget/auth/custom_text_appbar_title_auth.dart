import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextAppBarTitleAuth extends StatelessWidget {
  const CustomTextAppBarTitleAuth({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .displayLarge!
          .copyWith(color: AppColor.grey),
    );
  }
}
