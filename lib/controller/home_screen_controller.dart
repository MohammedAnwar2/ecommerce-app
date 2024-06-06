import 'package:ecommerce/routes/route_app.dart';
import 'package:ecommerce/view/screen/home_page.dart';
import 'package:ecommerce/view/screen/notification.dart';
import 'package:ecommerce/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int index);
  goToCart();
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  List<Widget> listPages = [
    const HomePage(),
    const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("profile")],
      ),
    ),
    NotificationPage(),
    Settings()
  ];

  List<List> navigationBarNames = [
    ["58".tr, Icons.home],
    ["60".tr, Icons.person],
    ["67".tr, Icons.notifications_active],
    ["59".tr, Icons.settings]
  ];
  @override
  changePage(int index) {
    currentPage = index;
    update();
  }

  @override
  goToCart() {
    Get.toNamed(AppRoute.myCardScreen);
  }
}
