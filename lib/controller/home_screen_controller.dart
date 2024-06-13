import 'package:ecommerce/routes/route_app.dart';
import 'package:ecommerce/view/screen/home_page.dart';
import 'package:ecommerce/view/screen/notification.dart';
import 'package:ecommerce/view/screen/offers.dart';
import 'package:ecommerce/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int index);
  goToCart();
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  List<Widget> listPages = [
    const HomePage(),
    const Offers(),
    const NotificationPage(),
    Settings()
  ];

  List<List> navigationBarNames = [
    ["58".tr, FontAwesomeIcons.house],
    ["68".tr, FontAwesomeIcons.gift],
    ["67".tr, FontAwesomeIcons.solidBell],
    ["59".tr, FontAwesomeIcons.gear]
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
