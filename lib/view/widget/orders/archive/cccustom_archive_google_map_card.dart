import 'package:ecommerce/controller/orders/archive_details_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomArchiveGoogleMapCard
    extends GetView<OrderArchiveDetailsControllerImp> {
  const CustomArchiveGoogleMapCard({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
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
            controller.completorController.complete(googleMapController);
          },
        ),
      ),
    );
  }
}
