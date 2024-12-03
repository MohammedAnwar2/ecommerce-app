import 'dart:developer';

import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AdressData {
  Crud crud;
  AdressData(this.crud);

  viewAddress(String userId) async {
    var response = await crud.postData(AppLink.viewAdress, {"usersId": userId});
    return response.fold((l) => l, (r) => r);
  }

  addAddress(int userId, String addressName, String addressCity,
      String addressStreet, LatLng latLng) async {
    var response = await crud.postData(AppLink.addAdress, {
      "usersId": userId.toString(),
      "name": addressName,
      "city": addressCity,
      "street": addressStreet,
      "lat": latLng.latitude.toString(),
      "long": latLng.longitude.toString()
    });
    log("status = ${response.fold((l) => l, (r) => r)}");
    return response.fold((l) => l, (r) => r);
  }

  deleteAddress(String addressId) async {
    var response =
        await crud.postData(AppLink.deleteAdress, {"addressId": addressId});
    return response.fold((l) => l, (r) => r);
  }

  editAddress(String addressId, String name, String city, String street,
      LatLng latLng) async {
    var response = await crud.postData(AppLink.editAdress, {
      "addressId": addressId,
      "name": name,
      "city": city,
      "street": street,
      "lat": latLng.latitude.toString(),
      "long": latLng.longitude.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}
