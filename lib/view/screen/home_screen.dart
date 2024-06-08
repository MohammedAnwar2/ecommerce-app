import 'dart:io';

import 'package:ecommerce/controller/home_screen_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/home/custom_buttom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    HomeScreenControllerImp controller = Get.put(HomeScreenControllerImp());
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(0, 0),
          child: GetBuilder<HomeScreenControllerImp>(
            builder: (controller) => AppBar(
              backgroundColor: controller.currentPage != 3
                  ? AppColor.white
                  : AppColor.primaryColor,
            ),
          )),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        elevation: 5.0,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(16)),
        onPressed: () {
          controller.goToCart();
        },
        backgroundColor: AppColor.primaryColor,
        child: const Icon(
          Icons.shopping_basket_outlined,
          color: AppColor.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomButtomNavigationBar(),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          Get.defaultDialog(
              title: "Warning",
              middleText: "Do You Want To Exit The App ? ",
              onCancel: () {},
              middleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.grey500,
                  fontSize: fontSize(15)),
              titleStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColor.secondaryColor,
                  fontSize: fontSize(18)),
              cancelTextColor: AppColor.secondaryColor,
              confirmTextColor: AppColor.white,
              buttonColor: AppColor.thirdColor,
              onConfirm: () {
                exit(0);
              });
        },
        child: GetBuilder<HomeScreenControllerImp>(
          builder: (controller) =>
              controller.listPages.elementAt(controller.currentPage),
        ),
      ),
    );
  }
}
