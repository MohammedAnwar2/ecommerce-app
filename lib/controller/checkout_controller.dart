import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/core/functions/paypal_payment.dart';
import 'package:ecommerce/core/functions/show_custom_snackbar.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/data/datasource/remote/address.dart';
import 'package:ecommerce/data/datasource/remote/orders/checkout.dart';
import 'package:ecommerce/data/model/view_address_model.dart';
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
}

mixin CheckoutControllerVaraibles {
  String? paymentType;
  String? deliveryType;
  String addressId = "0";

  late String couponid;
  late String totalPrice;
  late String discountCoupon;
  late int id;
  StatusRequest statusRequest = StatusRequest.success;
  AdressData adressData = AdressData(Get.find());
  CheckoutData checkoutData = CheckoutData(Get.find());
  MyServices services = Get.find<MyServices>();
  List<ViewAddressModel> viewAddressList = [];
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

    if (paymentType == "1") {
      var transactionData = getTransactionData(totalPrice);
      int paymentSuccess = await executePaymentPayPal(transactionData);
      if (paymentSuccess == 1) {
        await handleCheckout("1");
      } else if (paymentSuccess == 0) {
        showCustomSnackbar(
            "There are something went wrong with PayPal payment");
      } else {
        showCustomSnackbar("Cancel PayPal payment");
      }
    } else {
      await handleCheckout("0");
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
  }

  @override
  goToAddAddress() {
    Get.toNamed(AppRoute.addAddress);
  }
}
