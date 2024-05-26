import 'dart:developer';

import 'package:ecommerce/controller/mix_class_controller/add_delete_items_methods.dart';
import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/data/datasource/remote/cart/check_coupon.dart';
import 'package:ecommerce/data/datasource/remote/cart/view_all_cart_products.dart';
import 'package:ecommerce/data/model/coupon_model.dart';
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
  checkCoupon();
  getTotalPiceAfterDiscount();
}

class MyCardControllerImp extends MyCardController {
  ViewCartData viewCartData = ViewCartData(Get.find());
  MyServices services = Get.find<MyServices>();
  List<ViewCartProductsModel> data = [];
  CouponModel couponData = CouponModel();
  double totalprice = 0.0;
  String totalcount = "";
  int discount = 0;
  String? couponName;
  late TextEditingController couponController;
  CheckCouponData checkCouponData = CheckCouponData(Get.find());
  @override
  initData() {
    id = services.sharePref.getInt(AppKey.usersId)!;
    viewAllCartProducts();
  }

  @override
  void onInit() {
    couponController = TextEditingController();
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
  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await checkCouponData.checkCoupon(couponController.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Map<String, dynamic> alldata = response['data'];
        couponData = CouponModel.fromJson(alldata);
        discount = couponData.couponDiscount!;
        couponName = couponData.couponName;
        //log(couponData.toString());
      } else {
        statusRequest = StatusRequest.success;
        discount = 0;
        //log("no data");
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

  @override
  getTotalPiceAfterDiscount() {
    return totalprice - totalprice * (discount / 100);
  }
}
