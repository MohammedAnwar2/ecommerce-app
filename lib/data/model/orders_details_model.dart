class OrdersDetailsModel {
  double? totalPrice;
  int? itemscount;
  int? cartId;
  int? cartUsersId;
  int? cartItemsId;
  int? cartOrders;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  double? itemsPrice;
  int? itemsDiscount;
  String? itemsDate;
  int? itemsCat;

  OrdersDetailsModel({
    this.totalPrice,
    this.itemscount,
    this.cartId,
    this.cartUsersId,
    this.cartItemsId,
    this.cartOrders,
    this.itemsId,
    this.itemsName,
    this.itemsNameAr,
    this.itemsDesc,
    this.itemsDescAr,
    this.itemsImage,
    this.itemsCount,
    this.itemsActive,
    this.itemsPrice,
    this.itemsDiscount,
    this.itemsDate,
    this.itemsCat,
  });

  factory OrdersDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrdersDetailsModel(
        totalPrice: (json['total_price'] as num?)?.toDouble(),
        itemscount: json['Itemscount'] as int?,
        cartId: json['cart_id'] as int?,
        cartUsersId: json['cart_usersId'] as int?,
        cartItemsId: json['cart_itemsId'] as int?,
        cartOrders: json['cart_orders'] as int?,
        itemsId: json['items_id'] as int?,
        itemsName: json['items_name'] as String?,
        itemsNameAr: json['items_name_ar'] as String?,
        itemsDesc: json['items_desc'] as String?,
        itemsDescAr: json['items_desc_ar'] as String?,
        itemsImage: json['items_image'] as String?,
        itemsCount: json['items_count'] as int?,
        itemsActive: json['items_active'] as int?,
        itemsPrice: (json['items_price'] as num?)?.toDouble(),
        itemsDiscount: json['items_discount'] as int?,
        itemsDate: json['items_date'] as String?,
        itemsCat: json['items_cat'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'total_price': totalPrice,
        'Itemscount': itemscount,
        'cart_id': cartId,
        'cart_usersId': cartUsersId,
        'cart_itemsId': cartItemsId,
        'cart_orders': cartOrders,
        'items_id': itemsId,
        'items_name': itemsName,
        'items_name_ar': itemsNameAr,
        'items_desc': itemsDesc,
        'items_desc_ar': itemsDescAr,
        'items_image': itemsImage,
        'items_count': itemsCount,
        'items_active': itemsActive,
        'items_price': itemsPrice,
        'items_discount': itemsDiscount,
        'items_date': itemsDate,
        'items_cat': itemsCat,
      };
}
