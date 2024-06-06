import 'package:ecommerce/controller/orders/archive_details_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchiveOrdersTable extends GetView<OrderArchiveDetailsControllerImp> {
  const ArchiveOrdersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            _buildHeaderCell("Item"),
            _buildHeaderCell("QTY"),
            _buildHeaderCell("Price"),
          ],
        ),
        ..._buildOrderRows(),
      ],
    );
  }

  Widget _buildHeaderCell(String title) {
    return Center(
      child: Text(
        title,
        style: TextStyle(
          color: AppColor.secondaryColor,
          fontWeight: FontWeight.bold,
          fontSize: fontSize(15),
        ),
      ),
    );
  }

  List<TableRow> _buildOrderRows() {
    return List.generate(
      controller.ordersDetailsList.length,
      (i) => TableRow(
        children: [
          _buildDataCell(controller.ordersDetailsList[i].itemsName.toString()),
          _buildDataCell(controller.ordersDetailsList[i].itemscount.toString()),
          _buildDataCell(controller.ordersDetailsList[i].itemsPrice.toString()),
        ],
      ),
    );
  }

  Widget _buildDataCell(String data) {
    return Center(
      child: Text(
        data,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
