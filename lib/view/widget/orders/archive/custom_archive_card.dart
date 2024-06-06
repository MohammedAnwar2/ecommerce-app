import 'package:ecommerce/controller/orders/archive_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/data/model/archive_orders_model.dart';
import 'package:ecommerce/view/widget/orders/custom_order_botton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CustomArchiveCard extends GetView<ArchiveConrollerImp> {
  const CustomArchiveCard({super.key, required this.archiveOrders});
  final ArchiveOrdersModel archiveOrders;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: verticalSized(5)),
      child: Card(
        color: Colors.white.withOpacity(1),
        child: Padding(
          padding: EdgeInsets.all(verticalSized(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order Number : ${archiveOrders.ordersId}",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: fontSize(18), fontWeight: FontWeight.bold),
                  ),
                  Text(
                    Jiffy.parse(archiveOrders.ordersDatetime!).fromNow(),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: fontSize(13),
                        fontWeight: FontWeight.bold,
                        color: AppColor.secondaryColor,
                        fontFamily: ""),
                  ),
                ],
              ),
              const Divider(thickness: 0.5),
              Text(
                  "Order Type : ${controller.printOrderType(archiveOrders.ordersType.toString())}",
                  style: Theme.of(context).textTheme.bodyLarge),
              Text("Order Price : ${archiveOrders.ordersPrice}\$",
                  style: Theme.of(context).textTheme.bodyLarge),
              Text("Delivery Price : ${archiveOrders.ordersPricedelivery}\$",
                  style: Theme.of(context).textTheme.bodyLarge),
              Text(
                  "Payment Method : ${controller.printPaymentMethod(archiveOrders.ordersPaymentmethod.toString())}",
                  style: Theme.of(context).textTheme.bodyLarge),
              Text(
                  "Order Status : ${controller.printStatus(archiveOrders.ordersStatus.toString())}",
                  style: Theme.of(context).textTheme.bodyLarge),
              const Divider(thickness: 0.8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Price : ${archiveOrders.ordersTotalprice}\$",
                    style: TextStyle(
                        color: AppColor.secondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize(14),
                        fontFamily: ""),
                  ),
                  Row(
                    children: [
                      // if (archiveOrders.ordersStatus == 0)
                      //   CustomOrderButtom(
                      //     text: "Delete",
                      //     onPressed: () {
                      //       controller
                      //           .deletePendingOrders(archiveOrders.ordersId!);
                      //     },
                      //   ),
                      horizontalSizedBox(10),
                      CustomOrderButtom(
                        text: "Details",
                        onPressed: () {
                          controller.goToOrderDetails(archiveOrders);
                        },
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
