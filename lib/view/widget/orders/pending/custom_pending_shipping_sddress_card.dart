import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/data/model/pending_orders_model.dart';
import 'package:flutter/material.dart';

class CustomPendingShippingAddressCard extends StatelessWidget {
  const CustomPendingShippingAddressCard({
    super.key,
    required this.pendingOrders,
  });
  final PendingOrdersModel pendingOrders;
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
          "${pendingOrders.orderAddressCity} - ${pendingOrders.orderAddressStreet} - ${pendingOrders.orderAddressName}",
          style:
              TextStyle(color: AppColor.grey500, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
