import 'package:ecommerce/controller/orders/details_controller.dart';
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
    OrderDetailsControllerImp controller = Get.put(OrderDetailsControllerImp());
    return Scaffold(
      appBar: AppBar(title: const Text("Order Details")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Card(
              color: AppColor.white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
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
                        const TableRow(children: [
                          Center(
                              child: Text(
                            "Macbook m1",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          Center(
                              child: Text("1",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          Center(
                              child: Text("1200",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                        ]),
                        const TableRow(children: [
                          Center(
                              child: Text("S22 Ultra",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          Center(
                              child: Text("2",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          Center(
                              child: Text("1100",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                        ]),
                      ],
                    ),
                    Text(
                      "Price : 2400\$",
                      style: TextStyle(
                          color: AppColor.secondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize(15)),
                    )
                  ],
                ),
              ),
            ),
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
                  "Damascus Street one",
                  style: TextStyle(
                      color: AppColor.grey500, fontWeight: FontWeight.bold),
                ),
              ),
            ),
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
                  onMapCreated: (GoogleMapController googleMapController) {
                    controller.completorController
                        .complete(googleMapController);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
