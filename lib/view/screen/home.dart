import 'package:ecommerce/controller/categories_controller.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/home/custom_appbar.dart';
import 'package:ecommerce/view/widget/home/custom_card.dart';
import 'package:ecommerce/view/widget/home/custom_card_categories.dart';
import 'package:ecommerce/view/widget/home/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});
  @override
  Widget build(BuildContext context) {
    CategoriesControllerImp controller = Get.put(CategoriesControllerImp());

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
                  SizedBox(
                    height: verticalSized(100),
                    width: verticalSized(70),
                    child: GetBuilder<CategoriesControllerImp>(
                      builder: (controller) => ListView.separated(
                        itemBuilder: (context, i) => CardCategories(
                          image: controller
                              .categoriesModelList[i].categoriesImage!,
                          title:
                              controller.categoriesModelList[i].categoriesName!,
                        ),
                        separatorBuilder: (context, index) =>
                            horizontalSizedBox(10),
                        itemCount: controller.categoriesModelList.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                  const CustomText(
                    text: "Product for you",
                  ),
                  verticalSizedBox(10),
                  SizedBox(
                    height: verticalSized(200),
                    child: GetBuilder<CategoriesControllerImp>(
                      builder: (controller) => ListView.separated(
                        itemBuilder: (context, i) => Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(
                                  horizontal: horizontalSize(10)),
                              child: Image.asset(
                                "assets/images/laptop.png",
                                height: verticalSized(100),
                                width: horizontalSize(150),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              height: verticalSized(120),
                              width: verticalSized(170),
                              decoration: BoxDecoration(
                                  color: AppColor.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(24)),
                            ),
                            Positioned(
                              left: horizontalSize(10),
                              child: Text(
                                "Labtop aeser 12",
                                style: TextStyle(
                                    fontSize: fontSize(20),
                                    color: AppColor.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        separatorBuilder: (context, index) =>
                            horizontalSizedBox(5),
                        itemCount: controller.categoriesModelList.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
