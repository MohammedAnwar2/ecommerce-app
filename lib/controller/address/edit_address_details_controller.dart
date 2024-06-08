import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/data/datasource/remote/address.dart';
import 'package:ecommerce/data/model/view_address_model.dart';
import 'package:ecommerce/routes/route_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

mixin EditAddressDetailsMethods {
  initData();
  editAddress();
  bool checkValue();
}
mixin EditAddressDetailsVariables {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late ViewAddressModel dataList;
  StatusRequest statusRequest = StatusRequest.success;
  AdressData adressData = AdressData(Get.find());

  late LatLng latLng;
  late int addressId;
  late TextEditingController name;
  late TextEditingController street;
  late TextEditingController city;
}

class EditAddressDetailsControllerImp extends GetxController
    with EditAddressDetailsMethods, EditAddressDetailsVariables {
  @override
  bool checkValue() {
    return dataList.addressName == name.text &&
        dataList.addressCity == city.text &&
        dataList.addressLat == latLng.latitude &&
        dataList.addressLong == latLng.longitude &&
        dataList.addressStreet == street.text;
  }

  @override
  editAddress() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await adressData.editAddress(
        addressId.toString(),
        name.text,
        city.text,
        street.text,
        LatLng(latLng.latitude, latLng.longitude),
      );

      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.offAllNamed(AppRoute.homeScreen);
        } else {
          if (checkValue()) {
            Get.offAllNamed(AppRoute.homeScreen);
          } else {
            statusRequest = StatusRequest.serverfailure;
          }
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
    dataList = Get.arguments["data"];
    latLng = LatLng(dataList.addressLat!, dataList.addressLong!);
    addressId = dataList.addressId!;
    name.text = dataList.addressName!;
    street.text = dataList.addressStreet!;
    city.text = dataList.addressCity!;
  }
}
