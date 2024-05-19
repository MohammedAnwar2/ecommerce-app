import 'dart:async';
import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/services/location_services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

abstract class AddAddressController extends GetxController {
  getCurrentLocation();
}

class AddAddressControllerIma extends AddAddressController {
  CameraPosition? kGooglePlex;
  late Completer<GoogleMapController> completorController;
  StatusRequest statusRequest = StatusRequest.none;
  @override
  void onInit() {
    getCurrentLocation();
    completorController = Completer<GoogleMapController>();
    super.onInit();
  }

  @override
  getCurrentLocation() async {
    statusRequest = StatusRequest.loading;
    update();
    LocationData location = await LocationService().getLocation();
    kGooglePlex = CameraPosition(
      target: LatLng(location.latitude!, location.longitude!),
      zoom: 14.4746,
    );
    statusRequest = StatusRequest.success;
    update();
  }
}
