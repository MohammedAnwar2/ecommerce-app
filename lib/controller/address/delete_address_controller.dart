import 'dart:developer';

import 'package:ecommerce/controller/address/view_address_controller.dart';
import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/data/datasource/remote/address.dart';
import 'package:ecommerce/data/model/view_address_model.dart';
import 'package:get/get.dart';

abstract class DeleteAddressController extends GetxController {
  deleteAddress(int addressId);
  selectAddressToDelete(int index);
  deleteAddressFromButtom();
  initData();
}

class DeleteAddressControllerIma extends DeleteAddressController {
  StatusRequest statusRequest = StatusRequest.success;
  AdressData adressData = AdressData(Get.find());
  MyServices services = Get.find<MyServices>();
  List<bool> checkAddressItems = [];
  List<ViewAddressModel> viewAddressListdelete = [];
  ViewAddressControllerIma viewAddressController =
      Get.put(ViewAddressControllerIma());

  @override
  deleteAddress(int addressId) {
    adressData.deleteAddress(addressId.toString());
    viewAddressController.deleteSpecificAddress(addressId);
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  initData() {
    List<ViewAddressModel> dataList = Get.arguments["dataList"];
    viewAddressListdelete = List.from(dataList);
    log(viewAddressListdelete.length.toString());
    checkAddressItems = List.filled(dataList.length, false);
  }

  @override
  void selectAddressToDelete(int index) {
    checkAddressItems[index] = !checkAddressItems[index];
    update();
  }

  @override
  void deleteAddressFromButtom() {
    if (checkAddressItems.contains(true)) {
      for (int i = 0; i < checkAddressItems.length; i++) {
        if (checkAddressItems[i]) {
          deleteAddress(viewAddressListdelete[i].addressId!);
        }
      }
      Get.back();
    }
  }
}

// Future<void> deleteAddressFromButtom() async {
//   if (checkAddressItems.contains(true)) {
//     for (int i = 0; i < checkAddressItems.length; i++) {
//       if (checkAddressItems[i]) {
//         await deleteAddress(viewAddressList[i].addressId.toString());
//         viewAddressController
//             .deleteSpecificAddress(viewAddressList[i].addressId!);
//       }
//     }
//     Get.back(result: "update screen");
//   }
// }

// deleteAddress(String addressId) async {
//   statusRequest = StatusRequest.loading;
//   update();
//   var response = await adressData.deleteAddress(addressId);
//   statusRequest = handlingData(response);
//   if (statusRequest == StatusRequest.success) {
//     if (response['status'] == 'success') {
//     } else {
//       statusRequest = StatusRequest.serverfailure;
//     }
//   }
//   update();
// }
