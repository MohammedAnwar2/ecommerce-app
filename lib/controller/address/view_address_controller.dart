import 'dart:developer';

import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/data/datasource/remote/address.dart';
import 'package:ecommerce/data/model/view_address_model.dart';
import 'package:ecommerce/routes/route_app.dart';
import 'package:get/get.dart';

abstract class ViewAddressController extends GetxController {
  initData();
  viewAddress();
  // deleteAddress(String addressId);
  goToAddAddress();
  goToDeleteAddress();
}

class ViewAddressControllerIma extends ViewAddressController {
  late int id;
  StatusRequest statusRequest = StatusRequest.success;
  AdressData adressData = AdressData(Get.find());
  MyServices services = Get.find<MyServices>();
  List<ViewAddressModel> viewAddressList = [];
  @override
  viewAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await adressData.viewAddress(id.toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        viewAddressList.clear();
        List data = response['data'];
        viewAddressList.addAll(data.map((e) => ViewAddressModel.fromJson(e)));
      } else {
        viewAddressList.clear();
        statusRequest = StatusRequest.none;
      }
    }
    for (var element in viewAddressList) {
      log(element.addressName.toString());
    }
    update();
  }

  // viewAddress2() async {
  //   var response = await adressData.viewAddress(id.toString());
  //   statusRequest = handlingData(response);
  //   if (statusRequest == StatusRequest.success) {
  //     if (response['status'] == 'success') {
  //       viewAddressList.clear();
  //       List data = response['data'];
  //       viewAddressList.addAll(data.map((e) => ViewAddressModel.fromJson(e)));
  //     } else {
  //       viewAddressList.clear();
  //       statusRequest = StatusRequest.none;
  //     }
  //   }

  //   update();
  // }

  // @override
  // deleteAddress(String addressId) async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await adressData.deleteAddress(addressId);
  //   statusRequest = handlingData(response);
  //   if (statusRequest == StatusRequest.success) {
  //     if (response['status'] == 'success') {
  //       //   itemModelList.clear();
  //       //   List data = response['data'];
  //       //   itemModelList.addAll(data.map((e) => ItemModel.fromJson(e)));
  //     } else {
  //       statusRequest = StatusRequest.nodata;
  //       // Get.defaultDialog(
  //       //     title: response['status'].tr, middleText: response['status']);
  //     }
  //   }

  //   update();
  // }

  // editAddress(String addressId, String name, String city, String street,
  //     LatLng latLng) async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response =
  //       await adressData.editAddress(addressId, name, city, street, latLng);
  //   statusRequest = handlingData(response);
  //   if (statusRequest == StatusRequest.success) {
  //     if (response['status'] == 'success') {
  //       //   itemModelList.clear();
  //       //   List data = response['data'];
  //       //   itemModelList.addAll(data.map((e) => ItemModel.fromJson(e)));
  //     } else {
  //       statusRequest = StatusRequest.nodata;
  //       // Get.defaultDialog(
  //       //     title: response['status'].tr, middleText: response['status']);
  //     }
  //   }

  //   update();
  // }
  @override
  goToAddAddress() {
    Get.toNamed(AppRoute.addAddress);
  }

  @override
  initData() {
    id = services.sharePref.getInt(AppKey.usersId)!;
  }

  @override
  void onInit() {
    initData();
    viewAddress();
    super.onInit();
  }

  @override
  goToDeleteAddress() async {
    final result = await Get.toNamed(AppRoute.deleteAddress,
        arguments: {"dataList": viewAddressList});
    if (result != null) {
      viewAddress();
    }
  }
}
