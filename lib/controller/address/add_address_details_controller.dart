import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class AddAddressDetailsController extends GetxController {
  initData();
}

class AddAddressDetailsControllerImp extends AddAddressDetailsController {
  late LatLng latLng;
  late TextEditingController name;
  late TextEditingController street;
  late TextEditingController city;
  @override
  void onInit() {
    name = TextEditingController();
    street = TextEditingController();
    city = TextEditingController();
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
