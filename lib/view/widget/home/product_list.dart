import 'package:ecommerce/controller/categories_controller.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/home/item_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ProductItemList extends StatelessWidget {
  const ProductItemList({
    super.key,
    required this.image,
    required this.name,
  });
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: verticalSized(200),
      child: GetBuilder<CategoriesControllerImp>(
        builder: (controller) => ListView.separated(
          itemBuilder: (context, i) => ItemInfo(image: image, name: name),
          separatorBuilder: (context, index) => horizontalSizedBox(5),
          itemCount: controller.categoriesModelList.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
