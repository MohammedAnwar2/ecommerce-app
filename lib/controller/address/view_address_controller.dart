import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/data/datasource/remote/address.dart';
import 'package:ecommerce/data/model/view_address_model.dart';
import 'package:ecommerce/routes/route_app.dart';
import 'package:get/get.dart';

mixin ViewAddressMethods {
  initData();
  viewAddress();
  goToAddAddress();
  goToDeleteAddress();
  goToEditAddress(int index);
  deleteSpecificAddress(int idAddress);
}
mixin ViewAddressVariables {
  late int id;
  StatusRequest statusRequest = StatusRequest.success;
  AdressData adressData = AdressData(Get.find());
  MyServices services = Get.find<MyServices>();
  List<ViewAddressModel> viewAddressList = [];
}

class ViewAddressControllerIma extends GetxController
    with ViewAddressMethods, ViewAddressVariables {
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

  @override
  deleteSpecificAddress(int idAddress) {
    viewAddressList.removeWhere((element) => element.addressId == idAddress);
    if (viewAddressList.isEmpty) {
      statusRequest = StatusRequest.nolocation;
    }
    update();
  }

  @override
  goToEditAddress(int index) {
    Get.toNamed(AppRoute.editAddress,
        arguments: {"data": viewAddressList[index]});
  }
}
