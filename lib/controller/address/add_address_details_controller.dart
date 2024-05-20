import 'dart:developer';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class AddAddressPart2Controller extends GetxController {
  initData();
}

class AddAddressPart2ControllerImp extends AddAddressPart2Controller {
  late LatLng latLng;
  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  initData() {
    latLng = Get.arguments["latLng"];
    log(latLng.latitude.toString());
    log(latLng.longitude.toString());
  }
}
