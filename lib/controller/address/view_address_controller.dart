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
  goToAddAddress();
  goToDeleteAddress();
  goToEditAddress(int index);
  deleteSpecificAddress(int idAddress);
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
        statusRequest = StatusRequest.nolocation;
      }
    }

    update();
  }

  // editAddress(String addressId, String name, String city, String street,
  //     LatLng latLng) async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response =
  // await adressData.editAddress(addressId, name, city, street, latLng);
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
  goToDeleteAddress() {
    Get.toNamed(AppRoute.deleteAddress,
        arguments: {"dataList": viewAddressList});
  }
  // @override
  // goToDeleteAddress() async {
  //   final result = await Get.toNamed(AppRoute.deleteAddress,
  //       arguments: {"dataList": viewAddressList});
  //   if (result != null) {
  //     viewAddress();
  //   }
  // }

  @override
  deleteSpecificAddress(int idAddress) {
    viewAddressList.removeWhere((element) => element.addressId == idAddress);
    viewAddress();
    update();
  }

  @override
  goToEditAddress(int index) {
    Get.toNamed(AppRoute.editAddress,
        arguments: {"data": viewAddressList[index]});
  }
}
