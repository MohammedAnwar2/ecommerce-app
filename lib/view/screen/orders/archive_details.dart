import 'package:ecommerce/controller/orders/archive_details_controller.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/view/widget/orders/archive/cccustom_archive_google_map_card.dart';
import 'package:ecommerce/view/widget/orders/archive/custom_archive_shipping_sddress_card.dart';
import 'package:ecommerce/view/widget/orders/archive/orders_archive_table.dart';
import 'package:ecommerce/view/widget/orders/components/cutom_card_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderArchiveDetails extends StatelessWidget {
  const OrderArchiveDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderArchiveDetailsControllerImp());
    return Scaffold(
      appBar: AppBar(title: const Text("Order Details")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<OrderArchiveDetailsControllerImp>(
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
                          const ArchiveOrdersTable(),
                          CustomPriceCard(
                              text: "Delivery Price",
                              price: controller
                                  .archiveOrders.ordersPricedelivery!
                                  .toString()),
                          CustomPriceCard(
                              text: "Total Price",
                              price: controller.archiveOrders.ordersTotalprice!
                                  .toString()),
                        ],
                      ),
                    ),
                  ),
                  if (controller.archiveOrders.ordersType == 0)
                    CustomArchiveShippingAddressCard(
                        archiveOrders: controller.archiveOrders),
                  if (controller.archiveOrders.ordersType == 0)
                    const CustomArchiveGoogleMapCard()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
