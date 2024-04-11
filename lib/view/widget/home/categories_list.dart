import 'package:ecommerce/controller/home_page_controller.dart';
import 'package:ecommerce/core/class/animation.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/home/custom_categories_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomePageControllerImp> {
  const ListCategoriesHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: verticalSized(100),
      width: verticalSized(70),
      child: ListView.separated(
        itemBuilder: (context, i) => CustomAnimation(
          child: CardCategories(
            index: i,
            categoriesModel: controller.categoriesModelList[i],
          ),
        ),
        separatorBuilder: (context, index) => horizontalSizedBox(10),
        itemCount: controller.categoriesModelList.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
