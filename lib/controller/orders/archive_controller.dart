import 'dart:developer';

import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/data/datasource/remote/orders/archive.dart';
import 'package:ecommerce/data/model/archive_orders_model.dart';
import 'package:ecommerce/routes/route_app.dart';
import 'package:get/get.dart';

mixin AchiveConrollerMethods {
  viewArchiveOrders();
  printOrderType(String val);
  printPaymentMethod(String val);
  printStatus(String val);
  refreshPendingOrders();
  goToArchiveOrderDetails(ArchiveOrdersModel archiveOrders);
}
mixin AchiveConrollerVaraibles {
  late int id;
  StatusRequest statusRequest = StatusRequest.success;
  ArchiveData archiveData = ArchiveData(Get.find());
  MyServices services = Get.find<MyServices>();
  List<ArchiveOrdersModel> archiveOrdersList = [];
}

class ArchiveConrollerImp extends GetxController
    with AchiveConrollerVaraibles, AchiveConrollerMethods {
  @override
  viewArchiveOrders() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await archiveData.archiveOrder(id);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        archiveOrdersList.clear();
        List data = response['data'];
        print(data);
        log("successfully");
        archiveOrdersList
            .addAll(data.map((e) => ArchiveOrdersModel.fromJson(e)));
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
    viewArchiveOrders();
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
    await viewArchiveOrders();
  }

  @override
  goToArchiveOrderDetails(ArchiveOrdersModel archiveOrders) {
    Get.toNamed(AppRoute.orderArchiveDetails,
        arguments: {"archiveorderdetails": archiveOrders});
  }
}
