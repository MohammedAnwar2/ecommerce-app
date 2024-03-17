import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';

class CustomButtomOnboarding extends StatelessWidget {
  const CustomButtomOnboarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsetsDirectional.only(bottom: size(30)),
        padding: EdgeInsetsDirectional.symmetric(horizontal: size(60)),
        decoration: BoxDecoration(
            color: AppColor.blue, borderRadius: BorderRadius.circular(8)),
        child: TextButton(
          onPressed: () {},
          child: Text(
            "Continue",
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}