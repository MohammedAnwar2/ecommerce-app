import 'package:ecommerce/controller/categories_controller.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/home/categories_list.dart';
import 'package:ecommerce/view/widget/home/custom_appbar.dart';
import 'package:ecommerce/view/widget/home/custom_cashback_card.dart';
import 'package:ecommerce/view/widget/home/custom_text.dart';
import 'package:ecommerce/view/widget/home/product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesControllerImp());

    return Scaffold(body: GetBuilder<CategoriesControllerImp>(
      builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: SafeArea(
            child: Container(
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: horizontalSize(16)),
              child: ListView(
                padding: EdgeInsetsDirectional.only(top: verticalSized(10)),
                children: [
                  const CustomAppBar(
                    hintText: "Find Product",
                  ),
                  const CustomCard(
                      title: "A summer surprice", subTitle: "Cashback 20%"),
                  const CategoriesList(),
                  const CustomText(
                    text: "Product for you",
                  ),
                  verticalSizedBox(10),
                  const ProductItemList()
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
