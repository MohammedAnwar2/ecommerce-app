import 'dart:async';
import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/services/location_services.dart';
import 'package:ecommerce/routes/route_app.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

abstract class AddAddressController extends GetxController {
  getCurrentLocation();
  goToAddAddressDetails();
  changeTheLocation(LatLng latLng);
}

class AddAddressPart1ControllerImp extends AddAddressController {
  CameraPosition? kGooglePlex;
  late Completer<GoogleMapController> completorController;
  StatusRequest statusRequest = StatusRequest.none;
  late LatLng latLng;
  Set<Marker> markers = <Marker>{};

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
    getCurrentLocation();
    completorController = Completer<GoogleMapController>();
    super.onInit();
  }

  @override
  getCurrentLocation() async {
    statusRequest = StatusRequest.loading;
    update();
    LocationData location = await LocationService().getLocation();
    latLng = LatLng(location.latitude!, location.longitude!);
    kGooglePlex = CameraPosition(
      target: latLng,
      zoom: 16,
    );
    changeTheLocation(latLng);
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  goToAddAddressDetails() {
    Get.toNamed(AppRoute.addAddressDetails, arguments: {"latLng": latLng});
  }
}
