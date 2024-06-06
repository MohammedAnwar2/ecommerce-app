import 'package:ecommerce/controller/orders/pending_details_controller.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/view/widget/orders/pending/custom_pending_google_map_card.dart';
import 'package:ecommerce/view/widget/orders/components/cutom_card_price.dart';
import 'package:ecommerce/view/widget/orders/pending/orders_pending_table.dart';
import 'package:ecommerce/view/widget/orders/pending/custom_pending_shipping_sddress_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderPendingDetails extends StatelessWidget {
  const OrderPendingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderPendingDetailsControllerImp());
    return Scaffold(
      appBar: AppBar(title: const Text("Order Details")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<OrderPendingDetailsControllerImp>(
          builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  Card(
                    color: AppColor.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const PendingOrdersTable(),
                          CustomPriceCard(
                              text: "Delivery Price",
                              price: controller
                                  .pendingOrders!.ordersPricedelivery!
                                  .toString()),
                          CustomPriceCard(
                              text: "Total Price",
                              price: controller.pendingOrders!.ordersTotalprice!
                                  .toString()),
                        ],
                      ),
                    ),
                  ),
                  if (controller.pendingOrders!.ordersType == 0)
                    CustomPendingShippingAddressCard(
                        pendingOrders: controller.pendingOrders!),
                  if (controller.pendingOrders!.ordersType == 0)
                    const CustomPendingGoogleMapCard()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
