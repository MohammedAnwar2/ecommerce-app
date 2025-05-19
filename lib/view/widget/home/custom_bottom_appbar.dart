import 'package:ecommerce/controller/home_screen_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            FaIcon(
              icon,
              color: controller.currentPage == index
                  ? AppColor.primaryColor
                  : AppColor.grey600,
              size: raduis(18),
            ),
            // Text(
            //   text,
            //   maxLines: 1,
            //   overflow: TextOverflow.ellipsis,
            //   style: TextStyle(

            //     fontSize: fontSize(12),
            //     color: controller.currentPage == index
            //         ? AppColor.primaryColor
            //         : AppColor.grey600,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
