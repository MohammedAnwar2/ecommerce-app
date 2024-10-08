import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/functions/translate_database.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItems extends GetView<ItemsControllerImp> {
  const CategoryItems({
    super.key,
    required this.index,
    required this.categoryModel,
  });

  final int index;
  final CategoriesModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        controller.changeCategoryItem(index);
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
            builder: (controller) => Container(
              padding: EdgeInsetsDirectional.only(
                start: horizontalSize(10),
                end: horizontalSize(10),
                bottom: horizontalSize(5),
              ),
              //height: 5,
              decoration: index == controller.selectedCat
                  ? const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColor.primaryColor,
                          width: 3,
                        ),
                      ),
                    )
                  : null,
              child: Text(
                translateDatabase(
                    columnAr: categoryModel.categoriesNameAr!,
                    columnEn: categoryModel.categoriesName!),
                style: TextStyle(
                  color: AppColor.grey800,
                  fontSize: fontSize(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
