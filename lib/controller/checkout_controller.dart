import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/data/datasource/remote/address.dart';
import 'package:ecommerce/data/model/view_address_model.dart';
import 'package:get/get.dart';

abstract class CheckoutControllerMethods extends GetxController {
  choosePaymentMethod(String val);
  chooseDeliveryType(String val);
  chooseShippingAddress(String val);
  viewAddress();
  initData();
}

mixin CheckoutControllerVaraibles {
  String? paymentType;
  String? deliveryType;
  String? addressName;
  late int id;
  StatusRequest statusRequest = StatusRequest.success;
  AdressData adressData = AdressData(Get.find());
  MyServices services = Get.find<MyServices>();
  List<ViewAddressModel> viewAddressList = [];
}

class CheckoutControllerImp extends CheckoutControllerMethods
    with CheckoutControllerVaraibles {
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
  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  @override
  choosePaymentMethod(String val) {
    paymentType = val;
    update();
  }

  @override
  chooseShippingAddress(String val) {
    addressName = val;
    update();
  }

  @override
  void onInit() {
    initData();
    viewAddress();
    super.onInit();
  }

  @override
  initData() {
    id = services.sharePref.getInt(AppKey.usersId)!;
  }
}
