import 'package:ecommerce/controller/address/view_address_controller.dart';
import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/data/datasource/remote/address.dart';
import 'package:ecommerce/data/model/view_address_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';

abstract class DeleteAddressController extends GetxController {
  deleteAddress(String addressId);
  selectAddressToDelete(int index);
  deleteAddressFromButtom();
  initData();
}

class DeleteAddressControllerIma extends DeleteAddressController {
  StatusRequest statusRequest = StatusRequest.success;
  AdressData adressData = AdressData(Get.find());
  MyServices services = Get.find<MyServices>();
  List<bool> checkAddressItems = [];
  List<ViewAddressModel> viewAddressList = [];
  ViewAddressControllerIma viewAddressController =
      Get.put(ViewAddressControllerIma());
  // ViewAddressControllerIma viewAddressControll =
  //     Get.put(ViewAddressControllerIma());

  @override
  deleteAddress(String addressId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await adressData.deleteAddress(addressId);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
      } else {
        statusRequest = StatusRequest.serverfailure;
      }
    }
    update();
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  initData() {
    List<ViewAddressModel> dataList = Get.arguments["dataList"];
    viewAddressList = dataList;
    checkAddressItems = List.filled(dataList.length, false);
  }

  @override
  void selectAddressToDelete(int index) {
    checkAddressItems[index] = !checkAddressItems[index];
    update();
  }

  @override
  Future<void> deleteAddressFromButtom() async {
    if (checkAddressItems.contains(true)) {
      for (int i = 0; i < checkAddressItems.length; i++) {
        if (checkAddressItems[i]) {
          await deleteAddress(viewAddressList[i].addressId.toString());
        }
      }
      Get.back(result: "update screen");
    }
  }
}
