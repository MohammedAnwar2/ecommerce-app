import 'dart:math';
import 'package:ecommerce/controller/mix_class_controller/add_delete_items_methods.dart';
import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/core/functions/show_custom_snackbar.dart';
import 'package:ecommerce/core/functions/show_tost.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/data/datasource/remote/cart/check_coupon.dart';
import 'package:ecommerce/data/datasource/remote/cart/view_all_cart_products.dart';
import 'package:ecommerce/data/model/coupon_model.dart';
import 'package:ecommerce/data/model/view_cart_all_products.dart';
import 'package:ecommerce/routes/route_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class MyCardControllerMethods extends AddDeleteItemsCounter {
  @override
  addData(String itemId, itemprice);
  @override
  deleteData(String itemId);
  viewAllCartProducts();
  initData();
  resetView();
  refreshView();
  checkCoupon();
  getTotalPiceAfterDiscount();
  goToCheckOut();
}

mixin MyCardControllerVariables {
  ViewCartData viewCartData = ViewCartData(Get.find());
  MyServices services = Get.find<MyServices>();
  List<ViewCartProductsModel> viewCartProductsList = [];
  CouponModel couponData = CouponModel();
  double totalprice = 0.0;
  String totalcount = "";
  int discount = 0;
  String? couponName;
  String? couponId;
  late TextEditingController couponController;
  CheckCouponData checkCouponData = CheckCouponData(Get.find());
}

class MyCardControllerImp extends MyCardControllerMethods
    with MyCardControllerVariables {
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
    viewCartProductsList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewCartData.viewAllCartProducts(id.toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List alldata = response['datacart'];
        List countprice = response['countprice'];
        viewCartProductsList
            .addAll(alldata.map((e) => ViewCartProductsModel.fromJson(e)));
        totalprice = countprice[0]["totalprice"];
        totalcount = countprice[0]["totalcount"];
      } else {
        statusRequest = StatusRequest.nodata;
      }
    }
    update();
  }

  add(ViewCartProductsModel viewCartProductslist) async {
    if (viewCartProductslist.currentItemsCount! <
        viewCartProductslist.itemsCount!) {
      await addData(viewCartProductslist.itemsId.toString(),
          viewCartProductslist.itemsPrice.toString());
      refreshView();
    } else {
      showToast(text: "Sorry we have limited quantity");
    }
  }

  @override
  checkCoupon() async {
    if (couponController.text.trim().isNotEmpty) {
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
          couponId = couponData.couponId.toString();
          //log(couponData.toString());
        } else {
          statusRequest = StatusRequest.success;
          discount = 0;
          //! i do not know why ??
          couponId = null;
          couponName = null;
          //log("no data");
        }
      }
      update();
    }
  }

  @override
  refreshView() {
    resetView();
    viewAllCartProducts();
  }

  @override
  resetView() {
    viewCartProductsList.clear();
    totalcount = "";
    totalprice = 0;
  }

//* total price with discount
  double roundToDecimalPlaces(double value, int places) {
    double mod = pow(10.0, places).toDouble();
    return ((value * mod).round().toDouble() / mod);
  }

  @override
  getTotalPiceAfterDiscount() {
    var price = totalprice - totalprice * (discount / 100);
    return roundToDecimalPlaces(price, 2);
  }

  @override
  goToCheckOut() {
    if (viewCartProductsList.isNotEmpty) {
      Get.toNamed(AppRoute.checkOut, arguments: {
        "couponId": couponId ?? "0",
        "totalPice": totalprice.toString(),
        "discountCoupon": discount.toString(),
        "viewCartProductsList": viewCartProductsList
      });
    } else {
      showCustomSnackbar("THERE ARE NO ITEMS IN CART");
    }
  }
}
