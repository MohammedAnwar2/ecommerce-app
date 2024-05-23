import 'package:ecommerce/controller/mix_class_controller/add_delete_items_methods.dart';
import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/data/datasource/remote/cart/view_all_cart_products.dart';
import 'package:ecommerce/data/model/view_cart_all_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MyCardController extends AddDeleteItemsCounter {
  @override
  addData(String itemId);
  @override
  deleteData(String itemId);
  viewAllCartProducts();
  initData();
  resetView();
  refreshView();
}

class MyCardControllerImp extends MyCardController {
  ViewCartData viewCartData = ViewCartData(Get.find());
  MyServices services = Get.find<MyServices>();
  List<ViewCartProductsModel> data = [];
  double totalprice = 0.0;
  String totalcount = "";
  late TextEditingController couponCintroller;

  @override
  initData() {
    id = services.sharePref.getInt(AppKey.usersId)!;
    viewAllCartProducts();
  }

  @override
  void onInit() {
    couponCintroller = TextEditingController();
    initData();
    super.onInit();
  }

  @override
  viewAllCartProducts() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewCartData.viewAllCartProducts(id.toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List alldata = response['datacart'];
        List countprice = response['countprice'];
        data.addAll(alldata.map((e) => ViewCartProductsModel.fromJson(e)));
        totalprice = countprice[0]["totalprice"];
        totalcount = countprice[0]["totalcount"];
      } else {
        statusRequest = StatusRequest.nodata;
      }
    }
    update();
  }

  @override
  refreshView() {
    resetView();
    viewAllCartProducts();
  }

  @override
  resetView() {
    data.clear();
    totalcount = "";
    totalprice = 0;
  }
}
