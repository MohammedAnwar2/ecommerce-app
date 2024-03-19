import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/onboarding/custom_buttom.dart';
import 'package:ecommerce/view/widget/onboarding/dot_onboarding.dart';
import 'package:ecommerce/view/widget/onboarding/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onbording extends StatelessWidget {
  const Onbording({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImp());
    return Scaffold(
        backgroundColor: AppColor.background,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageViewBuilder(),
              ),
              const Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      CustomDotControllerOnboarding(),
                      Spacer(
                        flex: 2,
                      ),
                      CustomButtomOnboarding(),
                    ],
                  ))
            ],
          ),
        ));
  }
}
