import 'package:ecommerce/controller/onboardingController.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CustomDotControllerOnboarding extends StatelessWidget {
  const CustomDotControllerOnboarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImpOnboardingController>(
      init: ImpOnboardingController(),
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            onBoardingList.length,
            (index) => AnimatedContainer(
                  height: 6,
                  width: controller.dotValue == index ? 20 : 6,
                  margin: const EdgeInsetsDirectional.only(start: 5),
                  duration: const Duration(milliseconds: 700),
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                )),
      ),
    );
  }
}
