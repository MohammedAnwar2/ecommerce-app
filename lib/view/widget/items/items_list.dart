import 'package:ecommerce/controller/home_page_controller.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/items/custom_items_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsHome extends GetView<HomePageControllerImp> {
  const ListItemsHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: verticalSized(100),
      width: verticalSized(70),
      child: ListView.separated(
        itemBuilder: (context, i) => CardItems(
          index: i,
          image: controller.categoriesModelList[i].categoriesImage!,
          title: controller.categoriesModelList[i].categoriesName!,
        ),
        separatorBuilder: (context, index) => horizontalSizedBox(10),
        itemCount: controller.categoriesModelList.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
