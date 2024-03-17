import 'package:ecommerce/controller/onboardingController.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CustomButtomOnboarding extends GetView<ImpOnboardingController> {
  const CustomButtomOnboarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.nextPage();
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        margin: EdgeInsetsDirectional.only(bottom: verticalSized(30)),
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: horizontalSize(80), vertical: verticalSized(12)),
        decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(8)),
        child: const Text(
          "Continue",
          style: TextStyle(color: AppColor.white),
        ),
      ),
    );
  }
}
