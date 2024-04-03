import 'package:ecommerce/controller/categories_controller.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/home/custom_card.dart';
import 'package:ecommerce/view/widget/home/custom_card_categories.dart';
import 'package:ecommerce/view/widget/home/custom_notification.dart';
import 'package:ecommerce/view/widget/home/search_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});
  @override
  Widget build(BuildContext context) {
    CategoriesControllerImp controller = Get.put(CategoriesControllerImp());

    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: EdgeInsetsDirectional.symmetric(horizontal: horizontalSize(16)),
      child: ListView(
        padding: EdgeInsetsDirectional.only(top: verticalSized(10)),
        children: [
          Row(
            children: [
              const Expanded(
                child: SearchProduct(),
              ),
              horizontalSizedBox(10),
              const CustomNotification()
            ],
          ),
          CustomCard(),
          Container(
            height: verticalSized(100),
            width: verticalSized(100),
            child: GetBuilder<CategoriesControllerImp>(
              builder: (controller) => ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  controller.categoriesModelList.length,
                  (i) => Padding(
                    padding: EdgeInsets.all(horizontalSize(5)),
                    child: CardCategories(
                      title: controller.categoriesModelList[i].categoriesName
                          .toString(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    )));
  }
}
