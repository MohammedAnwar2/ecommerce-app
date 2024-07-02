import 'dart:async';
import 'package:ecommerce/core/services/polylines_services.dart';
import 'package:ecommerce/data/model/orders_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

mixin TrackingControllerMethods {
  initData();
  displayPolyLines();
  getCurrentLocation();
  getDeliveryLocation();
  updateTheDelivertMarks(LatLng deliveryLocation);
}
mixin TrackingControllerVariables {
  late CameraPosition cameraPosition;
  GoogleMapController? googleMapController;
  Set<Marker> markers = {};
  Set<Polyline> polyLines = {};
  late LatLng currentDeliveryLocation;
  late LatLng currentCustomerLocation;
  late OrdersModel ordersModel;
  late PolyLinceServices polylines;
  late StreamSubscription<LocationData> listen;
  StatusRequest statusRequest = StatusRequest.loading;
  late BitmapDescriptor icon;
  bool isOpen = false;
}

class TrackingControllerImp extends GetxController
    with TrackingControllerMethods, TrackingControllerVariables {
  @override
  void getCurrentLocation() async {
    currentCustomerLocation =
        LatLng(ordersModel.orderAddressLat!, ordersModel.orderAddressLong!);
    cameraPosition = CameraPosition(
      target: currentCustomerLocation,
      zoom: 15,
    );
    markers.add(Marker(
      markerId: const MarkerId("customer"),
      position: currentCustomerLocation,
      infoWindow: const InfoWindow(
        title: "Customer",
      ),
    ));
    icon = await polylines.changeMarkerIcons();
    getDeliveryLocation();
    update();
  }

  @override
  initData() {
    polylines = PolyLinceServices();
    ordersModel = Get.arguments["details"];
  }

  @override
  displayPolyLines() async {
    List<LatLng> points = await polylines.getRoutesData(
      currentLocation: currentDeliveryLocation,
      distenationLocation: currentCustomerLocation,
    );

    polylines.displayPolyLines(
      points: points,
      polyLines: polyLines,
      //googleMapController: googleMapController!,
    );
    update();
  }

  @override
  void onInit() {
    initData();
    getCurrentLocation();
    super.onInit();
  }

  @override
  void onClose() {
    googleMapController?.dispose();
    super.onClose();
  }

  @override
  getDeliveryLocation() {
    FirebaseFirestore.instance
        .collection("delivery")
        .doc(ordersModel.ordersId.toString())
        .snapshots()
        .listen(
      (event) {
        if (event.exists) {
          double lat = event["lat"];
          double long = event["log"];
          currentDeliveryLocation = LatLng(lat, long);
          updateTheDelivertMarks(currentDeliveryLocation);
        }
      },
    );
  }

  @override
  updateTheDelivertMarks(LatLng deliveryLocation) async {
    googleMapController
        ?.animateCamera(CameraUpdate.newLatLng(deliveryLocation));
    markers.removeWhere((element) => element.markerId.value == "delivery");
    markers.add(Marker(
        infoWindow: const InfoWindow(
          title: "Delivery",
        ),
        icon: icon,
        markerId: const MarkerId("delivery"),
        position: deliveryLocation));
    await displayPolyLines();
    statusRequest = StatusRequest.success;
    update();
  }
}
