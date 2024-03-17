import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomDotControllerOnboarding extends StatelessWidget {
  const CustomDotControllerOnboarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          4,
          (index) => AnimatedContainer(
                height: 6,
                width: 6,
                margin: EdgeInsetsDirectional.only(start: 5),
                duration: Duration(milliseconds: 700),
                decoration: BoxDecoration(
                    color: AppColor.blue,
                    borderRadius: BorderRadius.circular(10)),
              )),
    );
  }
}
