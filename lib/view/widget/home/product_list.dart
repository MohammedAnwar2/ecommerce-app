import 'package:ecommerce/controller/categories_controller.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/home/item_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ProductItemList extends StatelessWidget {
  const ProductItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: verticalSized(200),
      child: GetBuilder<CategoriesControllerImp>(
        builder: (controller) => ListView.separated(
          itemBuilder: (context, i) => ItemInfo(
              image: controller.categoriesModelList[i].categoriesImage!,
              name: controller.itemModelList[i].itemsName!),
          separatorBuilder: (context, index) => horizontalSizedBox(10),
          itemCount: controller.categoriesModelList.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
