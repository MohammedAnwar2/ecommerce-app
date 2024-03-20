import 'package:ecommerce/core/constant/keys.dart';
import 'package:ecommerce/core/services/service.dart';
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
  MyServices controller = Get.find<MyServices>();

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  nextPage() {
    ++dotValue;
    if (dotValue > onBoardingList.length - 1) {
      Get.offAllNamed(AppRoute.login);
      controller.sharePref.setBool(AppKey.authMiddleware, true);
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
