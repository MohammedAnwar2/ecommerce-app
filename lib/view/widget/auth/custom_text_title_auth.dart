import 'package:ecommerce/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextTitleAuth extends StatelessWidget {
  const CustomTextTitleAuth({
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
          .displayMedium!
          .copyWith(color: AppColor.black),
      textAlign: TextAlign.center,
    );
  }
}
