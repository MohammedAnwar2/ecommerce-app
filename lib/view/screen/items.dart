import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/components/custom_appbar.dart';
import 'package:ecommerce/view/widget/items/items_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsetsDirectional.all(horizontalSize(15)),
          children: [
            CustomAppBar(
              hintText: "Find Product",
              onPressedSearch: () {
                print("onPressedSearch");
              },
              onPressedNotification: () {
                print("onPressedNotification");
              },
            ),
            verticalSizedBox(20),
            const ListCategoriesItems(),
          ],
        ),
      ),
    );
  }
}
