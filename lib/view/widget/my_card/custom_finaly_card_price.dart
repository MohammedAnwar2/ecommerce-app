import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/my_card/custom_row_widget.dart';
import 'package:flutter/material.dart';

class CustomFinalyCardPrice extends StatelessWidget {
  const CustomFinalyCardPrice({
    super.key,
    required this.price,
    required this.shipping,
    required this.totalPrice,
  });

  final String price;
  final String shipping;
  final String totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: horizontalSize(22), vertical: verticalSized(10)),
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          CustomRowWidget(
            textColor: AppColor.grey500!,
            priceColor: AppColor.grey500!,
            text: "Price",
            price: price,
          ),
          CustomRowWidget(
            textColor: AppColor.grey500!,
            priceColor: AppColor.grey500!,
            text: "Shipping",
            price: shipping,
          ),
          const Divider(
            thickness: 0.5,
          ),
          CustomRowWidget(
            textColor: AppColor.secondaryColor,
            priceColor: AppColor.secondaryColor,
            text: "Total Price",
            price: totalPrice,
          ),
        ],
      ),
    );
  }
}
