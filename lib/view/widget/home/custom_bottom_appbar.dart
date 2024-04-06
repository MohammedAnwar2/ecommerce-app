import 'package:ecommerce/controller/home_screen_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    required this.text,
    required this.index,
    required this.icon,
    super.key,
  });
  final String text;
  final int index;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => MaterialButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {
          controller.changePage(index);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: controller.currentPage == index
                  ? AppColor.primaryColor
                  : AppColor.grey600,
            ),
            Text(
              text,
              style: TextStyle(
                color: controller.currentPage == index
                    ? AppColor.primaryColor
                    : AppColor.grey600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
