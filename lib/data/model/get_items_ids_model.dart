import 'package:ecommerce/core/functions/convers_datatypes.dart';

class GetItemsIdsOrdersModel {
  int? cartId;
  int? cartUsersId;
  int? cartItemsId;
  int? cartOrders;
  double? cartItemprice;
  int? currentcountitems;

  GetItemsIdsOrdersModel({
    this.cartId,
    this.cartUsersId,
    this.cartItemsId,
    this.cartOrders,
    this.cartItemprice,
    this.currentcountitems,
  });

  factory GetItemsIdsOrdersModel.fromJson(Map<String, dynamic> json) {
    return GetItemsIdsOrdersModel(
      cartId: json['cart_id'] as int?,
      cartUsersId: json['cart_usersId'] as int?,
      cartItemsId: json['cart_itemsId'] as int?,
      cartOrders: json['cart_orders'] as int?,
      cartItemprice: convertToDouble(json['cart_itemprice']),
      currentcountitems: json['currentcountitems'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'cart_id': cartId,
        'cart_usersId': cartUsersId,
        'cart_itemsId': cartItemsId,
        'cart_orders': cartOrders,
        'cart_itemprice': cartItemprice,
        'currentcountitems': currentcountitems,
      };
}
