import 'package:ecommerce/controller/orders/tracking_controller.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingOrder extends StatelessWidget {
  const TrackingOrder({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TrackingControllerImp());
    return Scaffold(
      appBar: AppBar(title: const Text("Orders Tracking")),
      body: GetBuilder<TrackingControllerImp>(
        builder: (trackingController) {
          return HandlingDataView(
            statusRequest: trackingController.statusRequest,
            widget: GoogleMap(
              markers: trackingController.markers,
              polylines: trackingController.polyLines,
              zoomControlsEnabled: true,
              initialCameraPosition: trackingController.cameraPosition,
              onMapCreated: (controller) {
                trackingController.googleMapController = controller;
              },
            ),
          );
        },
      ),
    );
  }
}
