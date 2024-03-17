import 'package:ecommerce/view/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnboardingController extends GetxController {
  nextPage();
  onPageChange(int value);
}

class ImpOnboardingController extends OnboardingController {
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
    if (dotValue > 3) {
      Get.offAll(() => const HomePage());
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
