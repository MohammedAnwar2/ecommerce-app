import 'package:ecommerce/controller/home_page_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_link.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CardCategories extends GetView<HomePageControllerImp> {
  const CardCategories({
    super.key,
    required this.categoriesModel,
    required this.index,
  });

  final CategoriesModel categoriesModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        controller.goToItems(
            categoriesList: controller.categoriesModelList, selectedCat: index);
      },
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: verticalSized(60),
            width: verticalSized(60),
            padding: EdgeInsetsDirectional.all(verticalSized(10)),
            margin: EdgeInsetsDirectional.only(top: verticalSized(10)),
            decoration: BoxDecoration(
                color: AppColor.thirdColor,
                borderRadius: BorderRadius.circular(16)),
            child: SvgPicture.network(
              "${AppLink.imageCategories}/${categoriesModel.categoriesImage}",
              colorFilter: const ColorFilter.mode(
                  AppColor.secondaryColor, BlendMode.srcIn),
            ),
          ),
          Text(categoriesModel.categoriesName!,
              style: TextStyle(color: AppColor.black, fontSize: fontSize(13)))
        ],
      ),
    );
  }
}
