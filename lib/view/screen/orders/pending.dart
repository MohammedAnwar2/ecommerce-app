import 'package:ecommerce/controller/orders/pending_controller.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/orders/pending/custom_pending_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingOrders extends StatelessWidget {
  const PendingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    PendingConrollerImp pendingConroller = Get.put(PendingConrollerImp());
    return Scaffold(
      appBar: AppBar(title: const Text("Orders")),
      body: GetBuilder<PendingConrollerImp>(
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
              itemCount: pendingConroller.pendingOrdersList.length,
              itemBuilder: (context, i) {
                return CustomPendingCard(
                    pendingOrders: pendingConroller.pendingOrdersList[i]);
              },
            ),
          );
        },
      ),
    );
  }
}
