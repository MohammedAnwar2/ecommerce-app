import 'dart:developer';

import 'package:ecommerce/controller/mix_class_controller/add_delete_items_methods.dart';
import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/core/functions/show_tost.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/data/datasource/remote/cart/get_count_cart.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:ecommerce/routes/route_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends AddDeleteItemsCounter {
  @override
  addData(String itemId, itemprice);
  @override
  deleteData(String itemId);
  initData();
  add();
  remove();
  goToCard();
  getCountData(String itemId);
}

class ProductDetailsControllerImp extends ProductDetailsController {
  int count = 0;
  CoutCartData coutCartData = CoutCartData(Get.find());
  MyServices services = Get.find<MyServices>();
  late ItemModel itemModel;
  List<Map<String, dynamic>> colors = [
    {"name": "Red", "id": 1, "active": "0"},
    {"name": "Blue", "id": 2, "active": "1"},
    {"name": "Black", "id": 3, "active": "0"},
  ];
  @override
  initData() async {
    id = services.sharePref.getInt(AppKey.usersId)!;
    statusRequest = StatusRequest.loading;
    itemModel = Get.arguments['itemModel'];
    count = await getCountData(itemModel.itemsId.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  add() {
    if (itemModel.itemsCount! > count) {
      count++;
      addData(itemModel.itemsId.toString(),
          itemModel.itemspricediscount.toString());
      update();
    } else {
      showToast(
          text: "Sorry we have limited quantity", height: verticalSized(100));
    }
  }

  @override
  remove() {
    if (count > 0) {
      count--;
      deleteData(itemModel.itemsId.toString());
    }
    update();
  }

  @override
  goToCard() {
    Get.offNamed(AppRoute.myCardScreen);
  }

  @override
  getCountData(String itemId) async {
    var response = await coutCartData.getCartCount(id.toString(), itemId);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        int count = 0;
        count = response['count'];
        return count;
      } else {
        return 0;
      }
    }
    update();
  }
}
