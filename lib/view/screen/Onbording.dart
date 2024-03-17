import 'package:ecommerce/controller/onboardingController.dart';
import 'package:ecommerce/view/widget/onboarding/customButtom.dart';
import 'package:ecommerce/view/widget/onboarding/dot_onboarding.dart';
import 'package:ecommerce/view/widget/onboarding/pageview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onbording extends StatelessWidget {
  const Onbording({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ImpOnboardingController());
    return Scaffold(
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
