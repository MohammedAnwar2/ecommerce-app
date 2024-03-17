import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextBodyAuth extends StatelessWidget {
  const CustomTextBodyAuth({
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
          .bodyLarge!
          .copyWith(color: AppColor.grey, height: 0),
      textAlign: TextAlign.center,
    );
  }
}
