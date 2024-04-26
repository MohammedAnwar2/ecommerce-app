import 'package:ecommerce/controller/home_screen_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/view/widget/home/custom_buttom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    HomeScreenControllerImp controller = Get.put(HomeScreenControllerImp());
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size(0, 0), child: AppBar()),
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
      body: GetBuilder<HomeScreenControllerImp>(
        builder: (controller) =>
            controller.listPages.elementAt(controller.currentPage),
      ),
    );
  }
}
