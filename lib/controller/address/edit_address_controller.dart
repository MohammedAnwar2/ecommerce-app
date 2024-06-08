import 'dart:async';
import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/data/model/view_address_model.dart';
import 'package:ecommerce/routes/route_app.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

mixin EditAddressMethods {
  initData();
  getCurrentLocation();
  goToEditAddressDetails();
  changeTheLocation(LatLng latLng);
}
mixin EditAddressVariables {
  CameraPosition? kGooglePlex;
  late Completer<GoogleMapController> completorController;
  StatusRequest statusRequest = StatusRequest.none;
  late LatLng latLng;
  Set<Marker> markers = <Marker>{};
  late ViewAddressModel dataList;
}

class EditAddressControllerImp extends GetxController
    with EditAddressMethods, EditAddressVariables {
  @override
  changeTheLocation(LatLng latLng) {
    this.latLng = latLng;
    markers.clear();
    markers.add(
      Marker(markerId: const MarkerId("1"), position: latLng),
    );
    update();
  }

  @override
  void onInit() {
    initData();
    getCurrentLocation();
    completorController = Completer<GoogleMapController>();
    super.onInit();
  }

  @override
  getCurrentLocation() async {
    statusRequest = StatusRequest.loading;
    update();
    kGooglePlex = CameraPosition(
      target: latLng,
      zoom: 16,
    );
    changeTheLocation(latLng);
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  goToEditAddressDetails() {
    dataList.addressLat = latLng.latitude;
    dataList.addressLong = latLng.longitude;
    Get.toNamed(AppRoute.editAddressDetails, arguments: {"data": dataList});
  }

  @override
  initData() {
    dataList = Get.arguments["data"];
    latLng = LatLng(dataList.addressLat!, dataList.addressLong!);
  }
}
