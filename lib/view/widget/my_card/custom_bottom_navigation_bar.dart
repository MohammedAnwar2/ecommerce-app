import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/my_card/custom_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustombottomNavigationBar extends StatelessWidget {
  const CustombottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.symmetric(horizontal: horizontalSize(25)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomRowWidget(
            textColor: AppColor.grey500!,
            priceColor: AppColor.grey500!,
            text: "Price",
            price: "1200",
          ),
          CustomRowWidget(
            textColor: AppColor.grey500!,
            priceColor: AppColor.grey500!,
            text: "Shipping",
            price: "300",
          ),
          const Divider(
            thickness: 0.5,
          ),
          const CustomRowWidget(
            textColor: AppColor.secondaryColor,
            priceColor: AppColor.secondaryColor,
            text: "Total Price",
            price: "1500",
          ),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.symmetric(
                horizontal: Get.width / 3 - horizontalSize(10)),
            onPressed: () {},
            color: AppColor.primaryColor,
            child: Text("Place Order",
                style: Theme.of(context).textTheme.displaySmall),
          ),
        ],
      ),
    );
  }
}
