import 'package:ecommerce/controller/orders/archive_controller.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/orders/archive/custom_archive_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchiveOrders extends StatelessWidget {
  const ArchiveOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveConrollerImp());
    return Scaffold(
      appBar: AppBar(title: const Text("Archive")),
      body: GetBuilder<ArchiveConrollerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              padding: EdgeInsets.only(
                left: horizontalSize(8),
                right: horizontalSize(8),
                top: verticalSized(8),
                bottom: verticalSized(10),
              ),
              itemCount: controller.archiveOrdersList.length,
              itemBuilder: (context, i) {
                return CustomArchiveCard(
                    archiveOrders: controller.archiveOrdersList[i]);
              },
            ),
          );
        },
      ),
    );
  }
}
