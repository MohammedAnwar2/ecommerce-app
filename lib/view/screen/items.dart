import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/class/animation.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/components/custom_appbar.dart';
import 'package:ecommerce/view/widget/items/custom_list_category_items.dart';
import 'package:ecommerce/view/widget/items/custom_list_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    Get.put(FavoriteControllerImp());
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: PreferredSize(preferredSize: const Size(0, 0), child: AppBar()),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsetsDirectional.all(horizontalSize(15)),
          children: [
            CustomAppBar(
              hintText: "62".tr,
              onPressedSearch: () {
                print("onPressedSearch");
              },
              onPressedFavorite: () {
                print("onPressedNotification");
              },
            ),
            verticalSizedBox(20),
            const ListCategoriesItems(),
            verticalSizedBox(20),
            const ListItems()
          ],
        ),
      ),
    );
  }
}
