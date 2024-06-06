import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/data/model/archive_orders_model.dart';
import 'package:flutter/material.dart';

class CustomArchiveShippingAddressCard extends StatelessWidget {
  const CustomArchiveShippingAddressCard({
    super.key,
    required this.archiveOrders,
  });
  final ArchiveOrdersModel archiveOrders;
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
          "${archiveOrders.addressCity} - ${archiveOrders.addressStreet} - ${archiveOrders.addressName}",
          style:
              TextStyle(color: AppColor.grey500, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
