import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/data/datasource/remote/offers/view.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:get/get.dart';
//viewNotifications

mixin ViewOffersMethods {
  getOffers();
}

mixin ViewOffersVariables {
  StatusRequest statusRequest = StatusRequest.success;
  ViewOffersData viewOffers = ViewOffersData(Get.find());
  List<ItemModel> oversList = [];
}

class ViewOffersControllerImp extends GetxController
    with ViewOffersMethods, ViewOffersVariables {
  @override
  getOffers() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewOffers.viewOffers();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        oversList.clear();
        List data = response['data'];
        oversList.addAll(data.map((e) => ItemModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.nodata;
      }
    }

    update();
  }

  @override
  void onInit() {
    getOffers();
    super.onInit();
  }
}
