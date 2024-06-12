import 'dart:async';
import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/data/datasource/remote/orders/details.dart';
import 'package:ecommerce/data/model/orders_details_model.dart';
import 'package:ecommerce/data/model/pending_orders_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

mixin OrderPendingDetailsMethods {
  initData();
  viewPendingOreredDetails();
}
mixin OrderPendingDetailsVaraible {
  PendingOrdersModel? pendingOrders;
  OrderDetailsData orderdetails = OrderDetailsData(Get.find());
  late CameraPosition cameraPosition;
  late Completer<GoogleMapController> completorController;
  StatusRequest statusRequest = StatusRequest.none;
  late LatLng latLng;
  Set<Marker> markers = <Marker>{};
  List<OrdersDetailsModel> ordersDetailsList = [];
}

class OrderPendingDetailsControllerImp extends GetxController
    with OrderPendingDetailsMethods, OrderPendingDetailsVaraible {
  @override
  viewPendingOreredDetails() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderdetails.orderDetails(pendingOrders!.ordersId!);
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
    pendingOrders = Get.arguments["pendingorderdetails"];
    if (pendingOrders!.ordersType == 0) {
      completorController = Completer<GoogleMapController>();
      latLng = LatLng(
          pendingOrders!.orderAddressLat!, pendingOrders!.orderAddressLong!);
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
    viewPendingOreredDetails();
    super.onInit();
  }
}
