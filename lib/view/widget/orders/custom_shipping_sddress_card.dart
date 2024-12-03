import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/data/model/orders_model.dart';
import 'package:flutter/material.dart';

class CustomShippingAddressCard extends StatelessWidget {
  const CustomShippingAddressCard({
    super.key,
    required this.ordersModel,
  });
  final OrdersModel ordersModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.white,
      child: ListTile(
        title: Text(
          "Shipping Address",
          style: TextStyle(
              color: AppColor.secondaryColor,
              fontWeight: FontWeight.bold,
              fontSize: fontSize(15)),
        ),
        subtitle: Text(
          "${ordersModel.orderAddressCity} - ${ordersModel.orderAddressStreet} - ${ordersModel.orderAddressName}",
          style:
              TextStyle(color: AppColor.grey500, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
