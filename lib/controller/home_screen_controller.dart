import 'package:ecommerce/view/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int index);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  List<Widget> listPages = [
    const HomePage(),
    const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Settings")],
      ),
    ),
    const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("profile")],
      ),
    ),
    const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("notification")],
      ),
    ),
  ];

  List<List> navigationBarNames = [
    ["58".tr, Icons.home],
    ["59".tr, Icons.settings],
    ["60".tr, Icons.person],
    ["61".tr, Icons.favorite]
  ];
  @override
  changePage(int index) {
    currentPage = index;
    update();
  }
}
