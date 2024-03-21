import 'package:ecommerce/controller/onboarding_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageViewBuilder extends GetView<OnboardingControllerImp> {
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
            Image.asset(
              onBoardingList[i].image,
              fit: BoxFit.fill,
              height: Get.width / 1.2,
            ),
            verticalSizedBox(60),
            Text(
              onBoardingList[i].title,
              style: TextStyle(
                  color: AppColor.black,
                  fontSize: fontSize(20),
                  fontWeight: FontWeight.bold),
              // style: Theme.of(context).textTheme.displayLarge,
            ),
            verticalSizedBox(20),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                onBoardingList[i].body,
                style: TextStyle(
                    color: AppColor.grey,
                    fontSize: fontSize(14),
                    height: 2,
                    fontWeight: FontWeight.bold),
                // style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }
}
