import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/data/datasource/remote/card_data.dart';
import 'package:get/get.dart';

abstract class MyCardController extends GetxController {
  addData(String itemId);
  deleteData(String itemId);
  getCountData(String itemId);
  initData();
}

class MyCardControllerImp extends MyCardController {
  CartData cartData = CartData(Get.find());
  StatusRequest statusRequest = StatusRequest.success;
  MyServices services = Get.find<MyServices>();
  late int id;
  @override
  initData() {
    id = services.sharePref.getInt(AppKey.usersId)!;
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  addData(String itemId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(id.toString(), itemId);
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
  deleteData(String itemId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart(id.toString(), itemId);
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
  getCountData(String itemId) async {
    var response = await cartData.upgradeCartCount(id.toString(), itemId);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        int count = 0;
        count = response['count'];
        print("--------------------- $count");
        return count;
      } else {
        return 0;
      }
    }
    update();
  }
}
