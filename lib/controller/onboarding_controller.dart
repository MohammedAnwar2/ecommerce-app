import 'package:ecommerce/data/datasource/static/static.dart';
import 'package:ecommerce/route/route_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnboardingController extends GetxController {
  nextPage();
  onPageChange(int value);
}

class OnboardingControllerImp extends OnboardingController {
  int dotValue = 0;
  PageController? pageController;
  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  nextPage() {
    ++dotValue;
    if (dotValue > onBoardingList.length - 1) {
      Get.offAllNamed(AppRoute.Login);
    } else {
      print(dotValue);
      pageController?.animateToPage(dotValue,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
      update();
    }
  }

  @override
  onPageChange(int value) {
    dotValue = value;
    update();
  }
}
