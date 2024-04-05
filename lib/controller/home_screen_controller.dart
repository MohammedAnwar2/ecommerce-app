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
    ["Home", Icons.home],
    ["Settings", Icons.settings],
    ["Profile", Icons.person],
    ["Favorite", Icons.favorite]
  ];
  @override
  changePage(int index) {
    currentPage = index;
    update();
  }
}
