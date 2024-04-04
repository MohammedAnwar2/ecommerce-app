import 'package:ecommerce/controller/categories_controller.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/home/custom_categories_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: verticalSized(100),
      width: verticalSized(70),
      child: GetBuilder<CategoriesControllerImp>(
        builder: (controller) => ListView.separated(
          itemBuilder: (context, i) => CardCategories(
            image: controller.categoriesModelList[i].categoriesImage!,
            title: controller.categoriesModelList[i].categoriesName!,
          ),
          separatorBuilder: (context, index) => horizontalSizedBox(10),
          itemCount: controller.categoriesModelList.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
