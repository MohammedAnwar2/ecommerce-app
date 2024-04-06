import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/data/model/categories_model.dart';
import 'package:ecommerce/view/components/custom_appbar.dart';
import 'package:ecommerce/view/widget/items/items_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    int i = Get.arguments['selectedCat'];
    List<CategoriesModel> category = Get.arguments['categoriesList'];
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
            const ListItemsHome(),
          ],
        ),
      ),
    );
  }
}
