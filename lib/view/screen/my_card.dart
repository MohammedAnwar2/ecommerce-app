import 'package:ecommerce/controller/my_card_controller.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/my_card/custom_appbar.dart';
import 'package:ecommerce/view/widget/my_card/custom_bottom_navigation_bar.dart';
import 'package:ecommerce/view/widget/my_card/items_count_card.dart';
import 'package:ecommerce/view/widget/my_card/list_items_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCardScreen extends StatelessWidget {
  const MyCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyCardControllerImp controller = Get.put(MyCardControllerImp());
    return Scaffold(
      bottomNavigationBar: const CustombottomNavigationBar(
        price: "1200",
        shipping: "300",
        totalPrice: "1500",
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: horizontalSize(16),
          vertical: verticalSized(30),
        ),
        children: const [
          MyCardAppBar(
            title: "My Cart",
          ),
          ItemsCountCard(
            text: "You Have 2 Items In Your List",
          ),
          ListItemsCard()
        ],
      ),
    );
  }
}
