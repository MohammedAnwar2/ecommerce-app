import 'dart:async';

import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/data/datasource/remote/orders/details.dart';
import 'package:ecommerce/data/model/archive_orders_model.dart';
import 'package:ecommerce/data/model/orders_details_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

mixin OrderArchiveDetailsMethods {
  initData();
  viewArchiveOreredDetails();
}
mixin OrderArchiveDetailsVaraible {
  late ArchiveOrdersModel archiveOrders;
  OrderDetailsData orderdetails = OrderDetailsData(Get.find());
  late CameraPosition cameraPosition;
  late Completer<GoogleMapController> completorController;
  StatusRequest statusRequest = StatusRequest.none;
  late LatLng latLng;
  Set<Marker> markers = <Marker>{};
  List<OrdersDetailsModel> ordersDetailsList = [];
}

class OrderArchiveDetailsControllerImp extends GetxController
    with OrderArchiveDetailsMethods, OrderArchiveDetailsVaraible {
  @override
  viewArchiveOreredDetails() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderdetails.orderDetails(archiveOrders.ordersId!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List data = response['data'];
        ordersDetailsList
            .addAll(data.map((e) => OrdersDetailsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.serverfailure;
      }
    }

    update();
  }

  @override
  initData() {
    archiveOrders = Get.arguments["archiveorderdetails"];
    if (archiveOrders.ordersType == 0) {
      completorController = Completer<GoogleMapController>();
      latLng = LatLng(
          archiveOrders.orderAddressLat!, archiveOrders.orderAddressLong!);
      cameraPosition = CameraPosition(
        target: latLng,
        zoom: 16,
      );
      markers.add(
        Marker(markerId: const MarkerId("1"), position: latLng),
      );
    }
  }

  @override
  void onInit() {
    initData();
    viewArchiveOreredDetails();
    super.onInit();
  }
}
