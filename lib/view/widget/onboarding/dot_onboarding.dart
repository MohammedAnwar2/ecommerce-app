import 'package:ecommerce/controller/onboardingController.dart';
import 'package:ecommerce/core/constant/color.dart';
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
            4,
            (index) => AnimatedContainer(
                  height: 6,
                  width: controller.dotValue == index ? 15 : 6,
                  margin: const EdgeInsetsDirectional.only(start: 5),
                  duration: const Duration(milliseconds: 700),
                  decoration: BoxDecoration(
                      color: AppColor.blue,
                      borderRadius: BorderRadius.circular(10)),
                )),
      ),
    );
  }
}
