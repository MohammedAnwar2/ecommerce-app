import 'dart:math';

import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/core/functions/paypal_payment.dart';
import 'package:ecommerce/core/functions/show_custom_snackbar.dart';
import 'package:ecommerce/core/functions/show_tost.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/data/datasource/remote/address.dart';
import 'package:ecommerce/data/datasource/remote/orders/check_existing_items.dart';
import 'package:ecommerce/data/datasource/remote/orders/checkout.dart';
import 'package:ecommerce/data/datasource/remote/orders/decrease_items.dart';
import 'package:ecommerce/data/model/view_address_model.dart';
import 'package:ecommerce/data/model/view_cart_all_products.dart';
import 'package:ecommerce/routes/route_app.dart';
import 'package:get/get.dart';

mixin CheckoutControllerMethods {
  choosePaymentMethod(String val);
  chooseDeliveryType(String val);
  chooseShippingAddress(String val);
  getShippingAddress();
  checkoutProcess();
  initData();
  goToAddAddress();
  handleCheckout(String paymentWay);
  double roundToDecimalPlaces(double value, int places);
  getTotalPiceAfterDiscount();
  Future<bool> checkExistingItemsMethod(int itemsid, int currentitemscount);
  Future<bool> decreaseItemsMethod(int itemsid, int currentitemscount);
}

mixin CheckoutControllerVaraibles {
  String? paymentType;
  String? deliveryType;
  String addressId = "0";

  bool isPressBotton = false;

  late String couponid;
  late String totalPrice;
  late String discountCoupon;
  late int id;
  StatusRequest statusRequest = StatusRequest.success;
  AdressData adressData = AdressData(Get.find());
  CheckoutData checkoutData = CheckoutData(Get.find());
  DecreaseItemsData decreaseItems = DecreaseItemsData(Get.find());
  CheckExistingItemsData checkExistingItems =
      CheckExistingItemsData(Get.find());
  MyServices services = Get.find<MyServices>();
  List<ViewAddressModel> viewAddressList = [];
  List<ViewCartProductsModel> viewCartProductsList = [];
}

class CheckoutControllerImp extends GetxController
    with CheckoutControllerMethods, CheckoutControllerVaraibles {
  @override
  getShippingAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await adressData.viewAddress(id.toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        viewAddressList.clear();
        List data = response['data'];
        viewAddressList.addAll(data.map((e) => ViewAddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.none;
      }
    }

    update();
  }

  @override
  checkoutProcess() async {
    if (paymentType == null) {
      return showCustomSnackbar("You Should Select Payment Type");
    }
    if (deliveryType == null) {
      return showCustomSnackbar("You Should Select Delivery Type");
    }
    if (deliveryType == "0" && viewAddressList.isEmpty) {
      return showCustomSnackbar("You Should Add Your Address");
    }
    for (var element in viewCartProductsList) {
      if (!await checkExistingItemsMethod(
          element.itemsId!, element.currentItemsCount!)) {
        return showToast(
            text: "sorry we have limited item count of ${element.itemsName}");
      }
    }
    for (var element in viewCartProductsList) {
      await decreaseItemsMethod(element.itemsId!, element.currentItemsCount!);
    }
    if (!isPressBotton) {
      isPressBotton = true;
      Future.delayed(const Duration(seconds: 5), () {
        isPressBotton = false;
      });
      if (paymentType == "1") {
        var transactionData = getTransactionData(getTotalPiceAfterDiscount());
        await executePaymentPayPal(
          transactionData,
          (paymentSuccess) async {
            if (paymentSuccess == 1) {
              await handleCheckout("1");
            } else if (paymentSuccess == 0) {
              showCustomSnackbar(
                  "There are something went wrong with PayPal payment");
            } else {
              showCustomSnackbar("Cancel PayPal payment");
            }
          },
        );
      } else {
        await handleCheckout("0");
      }
    }
  }

  //! 0 -> cash
  //! 1 -> card
  @override
  handleCheckout(String paymentWay) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await checkoutData.checkout(id, paymentType!, addressId,
        deliveryType!, "30", totalPrice, discountCoupon, couponid);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        if (paymentWay == "1") {
          Get.snackbar(
              "Successfully", "The Payment Was Completed Successfully");
        } else {
          Get.snackbar("Successfully", "Your Ordr Is Under The Processing");
          Get.offAllNamed(AppRoute.homeScreen);
        }
        // Get.offAllNamed(AppRoute.homeScreen);
      } else {
        showCustomSnackbar("The Order Not Completed Successfully");
        Get.offAllNamed(AppRoute.homeScreen);
      }
    }
    update();
  }

  @override
  chooseDeliveryType(String val) {
    if (val == "0" && viewAddressList.isNotEmpty) {
      addressId = viewAddressList[0].addressId.toString();
    } else {
      addressId = "0";
    }
    deliveryType = val;
    update();
  }

  @override
  choosePaymentMethod(String val) {
    paymentType = val;
    update();
  }

  @override
  chooseShippingAddress(String val) {
    addressId = val;
    update();
  }

  @override
  void onInit() {
    initData();
    getShippingAddress();
    super.onInit();
  }

  @override
  initData() {
    couponid = Get.arguments["couponId"];
    totalPrice = Get.arguments["totalPice"];
    discountCoupon = Get.arguments["discountCoupon"];
    id = services.sharePref.getInt(AppKey.usersId)!;
    viewCartProductsList = Get.arguments["viewCartProductsList"];
  }

  @override
  goToAddAddress() {
    Get.toNamed(AppRoute.addAddress);
  }

  //* total price with discount
  @override
  double roundToDecimalPlaces(double value, int places) {
    double mod = pow(10.0, places).toDouble();
    return ((value * mod).round().toDouble() / mod);
  }

  @override
  getTotalPiceAfterDiscount() {
    var price = double.parse(totalPrice) -
        double.parse(totalPrice) * (int.parse(discountCoupon) / 100);
    return roundToDecimalPlaces(price, 2).toString();
  }

  @override
  Future<bool> checkExistingItemsMethod(
      int itemsid, int currentitemscount) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await checkExistingItems.checkItems(itemsid, currentitemscount);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      statusRequest = StatusRequest.success;
      update();
      if (response['status'] == 'success') {
        return true;
      } else {
        return false;
      }
    } else {
      statusRequest = StatusRequest.success;
      update();
      return true;
    }
  }

  @override
  Future<bool> decreaseItemsMethod(int itemsid, int currentitemscount) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await decreaseItems.decreaseItems(itemsid, currentitemscount);
    statusRequest = handlingData(response);
    statusRequest = StatusRequest.success;
    update();
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }
}
