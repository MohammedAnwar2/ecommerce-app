import 'dart:developer';

import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/data/datasource/remote/orders/delete.dart';
import 'package:ecommerce/data/datasource/remote/orders/pending.dart';
import 'package:ecommerce/data/model/orders_model.dart';
import 'package:ecommerce/routes/route_app.dart';
import 'package:get/get.dart';

mixin PendingConrollerMethods {
  viewPendingOrders();
  printOrderType(String val);
  printPaymentMethod(String val);
  printStatus(String val);
  refreshPendingOrders();
  goToOrderDetails(OrdersModel ordersModel);
}
mixin PendingConrollerVaraibles {
  late int id;
  StatusRequest statusRequest = StatusRequest.success;
  PendingData pendingData = PendingData(Get.find());
  DeleteOrderData deleteOrderData = DeleteOrderData(Get.find());
  MyServices services = Get.find<MyServices>();
  List<OrdersModel> pendingOrdersList = [];
}

class PendingConrollerImp extends GetxController
    with PendingConrollerVaraibles, PendingConrollerMethods {
  @override
  viewPendingOrders() async {
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
        pendingOrdersList.addAll(data.map((e) => OrdersModel.fromJson(e)));
      } else {
        log("faild");
        statusRequest = StatusRequest.nodata;
      }
    }

    update();
  }

  deletePendingOrders(int orderid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await deleteOrderData.deleteOrder(orderid);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        refreshPendingOrders();
      } else {
        statusRequest = StatusRequest.nodata;
      }
    }

    update();
  }

  @override
  void onInit() {
    id = services.sharePref.getInt(AppKey.usersId)!;
    viewPendingOrders();
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
      return "The order has been recived with delivery man";
    } else if (val == "3") {
      return "On the way";
    } else {
      return "Archive";
    }
  }

  @override
  refreshPendingOrders() async {
    await viewPendingOrders();
  }

  @override
  goToOrderDetails(OrdersModel ordersModel) {
    Get.toNamed(AppRoute.orderDetails,
        arguments: {"orderdetails": ordersModel});
  }
}
