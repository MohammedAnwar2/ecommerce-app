import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';

class CustomPriceCard extends StatelessWidget {
  const CustomPriceCard({super.key, required this.price, required this.text});
  final String price;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalSize(36)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
                color: AppColor.secondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: fontSize(15)),
          ),
          Text(
            price,
            style: TextStyle(
                color: AppColor.secondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: fontSize(15)),
          ),
        ],
      ),
    );
  }
}
