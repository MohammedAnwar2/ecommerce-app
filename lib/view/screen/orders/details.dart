import 'package:ecommerce/controller/orders/details_controller.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsControllerImp());
    return Scaffold(
      appBar: AppBar(title: const Text("Order Details")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<OrderDetailsControllerImp>(builder: (controller) {
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
                        Table(
                          children: [
                            TableRow(children: [
                              Center(
                                child: Text("Item",
                                    style: TextStyle(
                                        color: AppColor.secondaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: fontSize(15))),
                              ),
                              Center(
                                child: Text("QTY",
                                    style: TextStyle(
                                        color: AppColor.secondaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: fontSize(15))),
                              ),
                              Center(
                                child: Text("Price",
                                    style: TextStyle(
                                        color: AppColor.secondaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: fontSize(15))),
                              ),
                            ]),
                            ...List.generate(
                                controller.ordersDetailsList.length,
                                (i) => TableRow(children: [
                                      Center(
                                          child: Text(
                                        controller
                                            .ordersDetailsList[i].itemsName
                                            .toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                      Center(
                                          child: Text(
                                              controller.ordersDetailsList[i]
                                                  .itemscount
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Center(
                                          child: Text(
                                              controller.ordersDetailsList[i]
                                                  .itemsPrice
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                    ])),
                          ],
                        ),
                        //Divider(),
                        CustomPriceCard(
                            text: "Delivery Price",
                            price: controller.pendingOrders.ordersPricedelivery!
                                .toString()),
                        CustomPriceCard(
                            text: "Total Price",
                            price: controller.pendingOrders.ordersTotalprice!
                                .toString()),
                      ],
                    ),
                  ),
                ),
                if (controller.pendingOrders.ordersType == 0)
                  Card(
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
                        "${controller.pendingOrders.addressCity!} - ${controller.pendingOrders.addressStreet!} - ${controller.pendingOrders.addressName!}",
                        style: TextStyle(
                            color: AppColor.grey500,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                if (controller.pendingOrders.ordersType == 0)
                  Card(
                    color: AppColor.white,
                    child: Container(
                      padding: EdgeInsets.all(horizontalSize(10)),
                      height: horizontalSize(300),
                      width: double.infinity,
                      child: GoogleMap(
                        markers: controller.markers,
                        mapType: MapType.normal,
                        initialCameraPosition: controller.cameraPosition,
                        onMapCreated:
                            (GoogleMapController googleMapController) {
                          controller.completorController
                              .complete(googleMapController);
                        },
                      ),
                    ),
                  )
              ],
            ),
          );
        }),
      ),
    );
  }
}

class CustomPriceCard extends StatelessWidget {
  const CustomPriceCard({super.key, required this.price, required this.text});
  final String price;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalSize(36)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
                color: AppColor.secondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: fontSize(15)),
          ),
          Text(
            price,
            style: TextStyle(
                color: AppColor.secondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: fontSize(15)),
          ),
        ],
      ),
    );
  }
}
