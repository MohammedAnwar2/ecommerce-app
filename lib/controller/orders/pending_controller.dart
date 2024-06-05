import 'dart:developer';

import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/data/datasource/remote/orders/pending.dart';
import 'package:ecommerce/data/model/pending_orders_model.dart';
import 'package:get/get.dart';

mixin PendingConrollerMethods {
  getPendingOrders();
  printOrderType(String val);
  printPaymentMethod(String val);
  printStatus(String val);
  refreshPendingOrders();
}
mixin PendingConrollerVaraibles {
  late int id;
  StatusRequest statusRequest = StatusRequest.success;
  PendingData pendingData = PendingData(Get.find());
  MyServices services = Get.find<MyServices>();
  List<PendingOrdersModel> pendingOrdersList = [];
}

class PendingConrollerImp extends GetxController
    with PendingConrollerVaraibles, PendingConrollerMethods {
  @override
  getPendingOrders() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingData.pendingOrder(id);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        pendingOrdersList.clear();
        List data = response['data'];
        print(data);
        log("successfully");
        pendingOrdersList
            .addAll(data.map((e) => PendingOrdersModel.fromJson(e)));
      } else {
        log("faild");
        statusRequest = StatusRequest.nodata;
      }
    }

    update();
  }

  @override
  void onInit() {
    id = services.sharePref.getInt(AppKey.usersId)!;
    getPendingOrders();
    super.onInit();
  }

  @override
  printOrderType(String val) {
    if (val == "0") {
      return "Delivery";
    } else {
      return "Store";
    }
  }

  @override
  printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash";
    } else {
      return "Payment card";
    }
  }

  @override
  printStatus(String val) {
    if (val == "0") {
      return "Await Approval";
    } else if (val == "1") {
      return "The order is being prepared";
    } else if (val == "2") {
      return "On the way";
    } else {
      return "Archive";
    }
  }

  @override
  refreshPendingOrders() async {
    await getPendingOrders();
  }
}
