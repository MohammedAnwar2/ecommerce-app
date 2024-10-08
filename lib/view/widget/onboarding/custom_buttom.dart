import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CustomButtomOnboarding extends GetView<OnboardingControllerImp> {
  const CustomButtomOnboarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: verticalSized(30)),
      child: MaterialButton(
        onPressed: () {
          controller.nextPage();
        },
        color: AppColor.primaryColor,
        textColor: AppColor.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsetsDirectional.symmetric(
            vertical: 12, horizontal: horizontalSize(80)),
        child: Text("8".tr, style: Theme.of(context).textTheme.displaySmall),
      ),
    );
  }
}
