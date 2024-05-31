import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/data/datasource/remote/orders/pending.dart';
import 'package:ecommerce/data/model/pending_orders_model.dart';
import 'package:get/get.dart';

mixin PendingConrollerMethods {
  getPendingOrders();
}
mixin PendingConrollerVaraibles {
  late int id;
  StatusRequest statusRequest = StatusRequest.success;
  PendingData pendingData = PendingData(Get.find());
  MyServices services = Get.find<MyServices>();
  List<PendingOrdersModel> viewAddressList = [];
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
        viewAddressList.clear();
        List data = response['data'];
        viewAddressList.addAll(data.map((e) => PendingOrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.nodata;
      }
    }

    update();
  }
}
