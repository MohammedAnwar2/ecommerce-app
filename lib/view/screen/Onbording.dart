import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/onboarding/customButtom.dart';
import 'package:ecommerce/view/widget/onboarding/dot_onboarding.dart';
import 'package:ecommerce/view/widget/onboarding/pageview.dart';
import 'package:flutter/material.dart';

class Onbording extends StatelessWidget {
  const Onbording({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageViewBuilder(),
          ),
          Expanded(
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





/*

 */
