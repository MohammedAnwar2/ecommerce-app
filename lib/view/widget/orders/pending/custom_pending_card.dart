import 'package:ecommerce/controller/orders/pending_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/data/model/pending_orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CustomCard extends GetView<PendingConrollerImp> {
  const CustomCard({super.key, required this.pendingOrders});
  final PendingOrdersModel pendingOrders;

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
                    "Order Number : ${pendingOrders.ordersId}",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: fontSize(18), fontWeight: FontWeight.bold),
                  ),
                  Text(
                    Jiffy.parse(pendingOrders.ordersDatetime!).fromNow(),
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
                  "Order Type : ${controller.printOrderType(pendingOrders.ordersType.toString())}",
                  style: Theme.of(context).textTheme.bodyLarge),
              Text("Order Price : ${pendingOrders.ordersPrice}\$",
                  style: Theme.of(context).textTheme.bodyLarge),
              Text("Delivery Price : ${pendingOrders.ordersPricedelivery}\$",
                  style: Theme.of(context).textTheme.bodyLarge),
              Text(
                  "Payment Method : ${controller.printPaymentMethod(pendingOrders.ordersPaymentmethod.toString())}",
                  style: Theme.of(context).textTheme.bodyLarge),
              Text(
                  "Order Status : ${controller.printStatus(pendingOrders.ordersStatus.toString())}",
                  style: Theme.of(context).textTheme.bodyLarge),
              const Divider(thickness: 0.8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Price : ${pendingOrders.ordersTotalprice}\$",
                    style: TextStyle(
                        color: AppColor.secondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize(14),
                        fontFamily: ""),
                  ),
                  MaterialButton(
                    color: AppColor.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    onPressed: () {
                      controller.goToOrderDetails(pendingOrders);
                    },
                    child: Text(
                      "Details",
                      style: TextStyle(
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize(14),
                      ),
                    ),
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
