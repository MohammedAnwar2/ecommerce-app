import 'package:ecommerce/data/model/items_model.dart';

class MyFavoriteModel {
  int? favoriteId;
  int? favoriteUsersId;
  int? favoriteItemsId;
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
  int? usersId;
  double? totalPrice; //! totalPrice = itemspricediscount

  MyFavoriteModel(
      {this.favoriteId,
      this.favoriteUsersId,
      this.favoriteItemsId,
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
      this.totalPrice,
      this.itemsCat,
      this.usersId});

  factory MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    return MyFavoriteModel(
        favoriteId: json['favorite_id'],
        favoriteUsersId: json['favorite_usersId'],
        favoriteItemsId: json['favorite_itemsId'],
        itemsId: json['items_id'],
        itemsName: json['items_name'],
        totalPrice: json['total_price'].toDouble(),
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
        usersId: json['users_id']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['favorite_id'] = favoriteId;
    data['favorite_usersId'] = favoriteUsersId;
    data['favorite_itemsId'] = favoriteItemsId;
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['total_price'] = totalPrice;
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
    data['users_id'] = usersId;
    return data;
  }

  void copyToItemModel(ItemModel itemModel) {
    itemModel.itemsId = itemsId;
    itemModel.itemsName = itemsName;
    itemModel.itemsNameAr = itemsNameAr;
    itemModel.itemsDesc = itemsDesc;
    itemModel.itemsDescAr = itemsDescAr;
    itemModel.itemsImage = itemsImage;
    itemModel.itemsCount = itemsCount;
    itemModel.itemsActive = itemsActive;
    itemModel.itemsPrice = itemsPrice;
    itemModel.itemsDiscount = itemsDiscount;
    itemModel.itemsDate = itemsDate;
    itemModel.itemsCat = itemsCat;
    itemModel.itemsPrice = itemsPrice;
    itemModel.itemspricediscount =
        totalPrice; //! totalPrice = itemspricediscount
  }
}
