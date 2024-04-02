import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/home/custom_card.dart';
import 'package:ecommerce/view/widget/home/custom_notification.dart';
import 'package:ecommerce/view/widget/home/search_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});
  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
        body: SafeArea(
            child: Container(
      child: ListView(
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(top: verticalSized(10)),
            padding:
                EdgeInsetsDirectional.symmetric(horizontal: horizontalSize(16)),
            child: Row(
              children: [
                const Expanded(
                  child: SearchProduct(),
                ),
                horizontalSizedBox(10),
                const CustomNotification()
              ],
            ),
          ),
          CustomCard()
        ],
      ),
    )));
  }
}
