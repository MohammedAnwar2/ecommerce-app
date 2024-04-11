import 'package:ecommerce/controller/home_page_controller.dart';
import 'package:ecommerce/core/class/animation.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/home/categories_list.dart';
import 'package:ecommerce/view/components/custom_appbar.dart';
import 'package:ecommerce/view/widget/home/custom_cashback_card.dart';
import 'package:ecommerce/view/widget/home/custom_text.dart';
import 'package:ecommerce/view/widget/home/product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());

    return GetBuilder<HomePageControllerImp>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: SafeArea(
          child: Container(
            padding:
                EdgeInsetsDirectional.symmetric(horizontal: horizontalSize(16)),
            child: ListView(
              padding: EdgeInsetsDirectional.only(top: verticalSized(10)),
              children: [
                CustomAnimation(
                  child: CustomAppBar(
                    hintText: "62".tr,
                    onPressedSearch: () {
                      print("onPressedSearch");
                    },
                    onPressedNotification: () {
                      print("onPressedNotification");
                    },
                  ),
                ),
                const CustomAnimation(
                  child: CustomCardCashBackHome(
                      title: "A summer surprice", subTitle: "Cashback 20%"),
                ),
                CustomAnimation(
                  child: CustomText(
                    text: "63".tr,
                  ),
                ),
                const ListCategoriesHome(),
                CustomAnimation(
                  child: CustomText(
                    text: "64".tr,
                  ),
                ),
                CustomAnimation(child: verticalSizedBox(10)),
                const ListProductItem(),
                CustomAnimation(
                  child: CustomText(
                    text: "65".tr,
                  ),
                ),
                verticalSizedBox(10),
                const ListProductItem()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
