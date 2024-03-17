import 'package:ecommerce/controller/onboardingController.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PageViewBuilder extends GetView<ImpOnboardingController> {
  PageViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: onBoardingList.length,
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChange(value);
      },
      itemBuilder: (context, i) {
        return Column(
          children: [
            Text(
              onBoardingList[i].title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            verticalSizedBox(80),
            Image.asset(
              onBoardingList[i].image,
              width: 200,
              fit: BoxFit.fill,
              height: 250,
            ),
            verticalSizedBox(80),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                onBoardingList[i].body,
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }
}
