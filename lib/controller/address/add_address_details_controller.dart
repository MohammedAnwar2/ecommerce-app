import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/data/datasource/remote/address.dart';
import 'package:ecommerce/routes/route_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

mixin AddAddressDetailsMethods {
  initData();
  addAddress();
}
mixin AddAddressDetailsVariables {
  late LatLng latLng;
  late TextEditingController name;
  late TextEditingController street;
  late TextEditingController city;
  late int id;
  StatusRequest statusRequest = StatusRequest.success;
  AdressData adressData = AdressData(Get.find());
  MyServices services = Get.find<MyServices>();
}

class AddAddressDetailsControllerImp extends GetxController
    with AddAddressDetailsMethods, AddAddressDetailsVariables {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  addAddress() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await adressData.addAddress(
          id, name.text, city.text, street.text, latLng);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.offAllNamed(AppRoute.homeScreen);
        } else {
          statusRequest = StatusRequest.serverfailure;
        }
      }

      update();
    }
  }

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
    id = services.sharePref.getInt(AppKey.usersId)!;
    latLng = Get.arguments["latLng"];
  }
}
