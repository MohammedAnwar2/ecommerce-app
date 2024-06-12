import 'dart:developer';
import 'package:ecommerce/data/model/amount_model/amount_model.dart';
import 'package:ecommerce/data/model/amount_model/details.dart';
import 'package:ecommerce/data/model/item_list_model/item.dart';
import 'package:ecommerce/data/model/item_list_model/item_list_model.dart';
import 'package:ecommerce/routes/route_app.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:get/get.dart';

({AmountModel amount, ItemListModel itemList}) getTransactionData(
    String totalPrice) {
  var amount = AmountModel(
    currency: 'USD',
    total: totalPrice,
    details:
        DetailsModel(shipping: "0", shippingDiscount: 0, subtotal: totalPrice),
  );

  List<OrderItemModel> orders = [
    // OrderItemModel(currency: 'USD', name: 'Apple', price: "4", quantity: 10),
    // OrderItemModel(currency: 'USD', name: 'Apple', price: "5", quantity: 12)
  ];
  var itemlist = ItemListModel(orders: orders);

  return (amount: amount, itemList: itemlist);
}

Future<int> executePaymentPayPal(
    ({AmountModel amount, ItemListModel itemList}) transactionData) async {
  int paymentSuccess = 0;
  await Get.to(PaypalCheckoutView(
    sandboxMode: true,
    clientId:
        "ASPdfQB7M-4RLVGevhyf_V_TYHlfV8fc4ErzRFjK6MA-EiKcFski2db-Z3kisEef_jl-1K66jjPkzp3J",
    secretKey:
        "EIbTuDdzysF-6ja15kDp9bm0KVM3CWh8KLvlwlr4hU2Ah03lF9V79spKSsLmFhE21JR-ShQ0xLe1fXQZ",
    transactions: [
      {
        "amount": transactionData.amount.toJson(),
        "description": "The payment transaction description.",
        // "payment_options": {
        //   "allowed_payment_method":
        //       "INSTANT_FUNDING_SOURCE"
        // },
        "item_list": transactionData.itemList.toJson()
      }
    ],
    note: "Contact us for any questions on your order.",
    onSuccess: (Map params) async {
      log("onSuccess: $params");
      paymentSuccess = 1;
      Get.offAllNamed(AppRoute.homeScreen);
    },
    onError: (error) {
      log("onError: $error");
      paymentSuccess = 0;
      Get.back();
    },
    onCancel: () {
      print('cancelled:');
      paymentSuccess = -1;
      Get.back();
    },
  ));
  return paymentSuccess;
}
