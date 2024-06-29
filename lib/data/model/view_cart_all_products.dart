class ViewCartProductsModel {
  double? totalPrice;
  int? itemscount;
  int? cartId;
  int? cartUsersId;
  int? cartItemsId;
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

  ViewCartProductsModel(
      {this.totalPrice,
      this.itemscount,
      this.cartId,
      this.cartUsersId,
      this.cartItemsId,
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
      this.itemsCat});

  factory ViewCartProductsModel.fromJson(Map<String, dynamic> json) {
    return ViewCartProductsModel(
      totalPrice: json['total_price'].toDouble(),
      itemscount: json['Itemscount'],
      cartId: json['cart_id'],
      cartUsersId: json['cart_usersId'],
      cartItemsId: json['cart_itemsId'],
      itemsId: json['items_id'],
      itemsName: json['items_name'],
      itemsNameAr: json['items_name_ar'],
      itemsDesc: json['items_desc'],
      itemsDescAr: json['items_desc_ar'],
      itemsImage: json['items_image'],
      itemsCount: json['items_count'],
      itemsActive: json['items_active'],
      itemsPrice: json['items_price'].toDouble(),
      itemsDiscount: json['items_discount'],
      itemsDate: json['items_date'],
      itemsCat: json['items_cat'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_price'] = totalPrice;
    data['Itemscount'] = itemscount;
    data['cart_id'] = cartId;
    data['cart_usersId'] = cartUsersId;
    data['cart_itemsId'] = cartItemsId;
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_desc'] = itemsDesc;
    data['items_desc_ar'] = itemsDescAr;
    data['items_image'] = itemsImage;
    data['items_count'] = itemsCount;
    data['items_active'] = itemsActive;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_date'] = itemsDate;
    data['items_cat'] = itemsCat;
    return data;
  }
}
