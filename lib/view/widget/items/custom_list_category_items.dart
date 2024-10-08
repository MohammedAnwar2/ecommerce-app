import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/items/custom_category_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: verticalSized(60),
      width: verticalSized(70),
      child: ListView.separated(
        itemBuilder: (context, i) => CategoryItems(
            index: i, categoryModel: controller.categoriesModelList[i]!),
        separatorBuilder: (context, index) => horizontalSizedBox(10),
        itemCount: controller.categoriesModelList.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
