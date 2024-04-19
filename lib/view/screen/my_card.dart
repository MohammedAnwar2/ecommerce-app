import 'package:ecommerce/controller/my_card_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/my_card/custom_appbar.dart';
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
      body: ListView(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: horizontalSize(16),
          vertical: verticalSized(30),
        ),
        children: [
          MyCardAppBar(
            onPressed: () {},
          ),
          const ItemsCountCard(
            text: "You Have 2 Items In Your List",
          ),
          ListItemsCard()
        ],
      ),
    );
  }
}
