import 'dart:async';

import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/data/model/pending_orders_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

mixin OrderDetailsMethods {
  initData();
}
mixin OrderDetailsVaraible {
  late PendingOrdersModel pendingOrders;

  late CameraPosition cameraPosition;
  late Completer<GoogleMapController> completorController;
  StatusRequest statusRequest = StatusRequest.none;
  late LatLng latLng;
  Set<Marker> markers = <Marker>{};
}

class OrderDetailsControllerImp extends GetxController
    with OrderDetailsMethods, OrderDetailsVaraible {
  @override
  initData() {
    pendingOrders = Get.arguments["orderdetails"];
    completorController = Completer<GoogleMapController>();
    latLng = const LatLng(22.3, 10.6);
    cameraPosition = CameraPosition(
      target: latLng,
      zoom: 6,
    );
    markers.add(
      Marker(markerId: const MarkerId("1"), position: latLng),
    );
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
