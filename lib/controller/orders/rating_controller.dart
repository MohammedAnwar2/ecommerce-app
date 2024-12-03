import 'package:ecommerce/controller/orders/archive_controller.dart';
import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/data/datasource/remote/orders/rating.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin RatingConrollerMethods {
  ratingProduct(int orderid);
  changeStarsRating(double value);
  resetValue();
  refreshArchivePage();
}
mixin RatingConrollerVaraibles {
  late int id;
  RatingData rating = RatingData(Get.find());
  MyServices services = Get.find<MyServices>();
  StatusRequest statusRequest = StatusRequest.success;
  late double ratingValue;
  late TextEditingController notes;
  ArchiveConrollerImp archiveConroller = Get.find<ArchiveConrollerImp>();
}

class RatingConrollerImp extends GetxController
    with RatingConrollerVaraibles, RatingConrollerMethods {
  @override
  ratingProduct(int orderid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await rating.ratingOrder(orderid, ratingValue, notes.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        refreshArchivePage();
      } else {
        statusRequest = StatusRequest.none;
      }
    }

    update();
  }

  @override
  void onInit() {
    id = services.sharePref.getInt(AppKey.usersId)!;
    notes = TextEditingController();
    ratingValue = 1;
    super.onInit();
  }

  @override
  changeStarsRating(double value) {
    ratingValue = value;
    update();
  }

  @override
  resetValue() {
    ratingValue = 1;
    notes.clear();
    update();
  }

  @override
  refreshArchivePage() {
    archiveConroller.viewArchiveOrders();
  }
}
