import 'dart:async';
import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/data/datasource/remote/orders/details.dart';
import 'package:ecommerce/data/model/orders_details_model.dart';
import 'package:ecommerce/data/model/orders_model.dart';
import 'package:ecommerce/routes/route_app.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

mixin OrderDetailsMethods {
  initData();
  viewPendingOreredDetails();
  viewArchiveOreredDetails();
  goToTracking();
}
mixin OrderDetailsVaraible {
  late OrdersModel ordersModel;
  OrderDetailsData orderdetails = OrderDetailsData(Get.find());
  late CameraPosition cameraPosition;
  late Completer<GoogleMapController> completorController;
  StatusRequest statusRequest = StatusRequest.none;
  late LatLng latLng;
  Set<Marker> markers = <Marker>{};
  List<OrdersDetailsModel> ordersDetailsList = [];
}

class OrderDetailsControllerImp extends GetxController
    with OrderDetailsMethods, OrderDetailsVaraible {
  @override
  viewPendingOreredDetails() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderdetails.orderDetails(ordersModel!.ordersId!);
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
  viewArchiveOreredDetails() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderdetails.orderDetails(ordersModel.ordersId!);
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
    ordersModel = Get.arguments["orderdetails"];
    if (ordersModel.ordersType == 0) {
      completorController = Completer<GoogleMapController>();
      latLng =
          LatLng(ordersModel.orderAddressLat!, ordersModel.orderAddressLong!);
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

  @override
  goToTracking() {
    Get.toNamed(AppRoute.trackingorder, arguments: {"details": ordersModel});
  }
}
