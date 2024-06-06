import 'package:ecommerce/controller/my_card_controller.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/my_card/custom_bottom_navigation_bar.dart';
import 'package:ecommerce/view/widget/my_card/items_count_card.dart';
import 'package:ecommerce/view/widget/my_card/list_items_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCardScreen extends StatelessWidget {
  const MyCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyCardControllerImp());
    return Scaffold(
      backgroundColor: AppColor.white,
      bottomNavigationBar: GetBuilder<MyCardControllerImp>(
        builder: (controller) => Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: CustombottomNavigationBar(
            shipping: controller.totalprice == 0.0 ? "0" : "30",
            price: controller.totalprice.toString(),
            discount: controller.discount.toString(),
            totalPrice: controller.getTotalPiceAfterDiscount().toString(),
            couponController: controller.couponController,
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        // backgroundColor: AppColor.white,
        iconTheme: IconThemeData(
            color: AppColor.primaryColor, size: horizontalSize(25)),
        title: const Text("My Cart"),
      ),
      body: GetBuilder<MyCardControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            padding: EdgeInsetsDirectional.only(
              start: horizontalSize(16),
              end: horizontalSize(16),
              top: verticalSized(0),
              bottom: verticalSized(16),
            ),
            children: [
              // const MyCardAppBar(
              //   title: "My Cart",
              // ),
              ItemsCountCard(
                text: "You Have ${controller.totalcount} Items In Your List",
              ),
              const ListItemsCard()
            ],
          ),
        ),
      ),
    );
  }
}
