class ArchiveOrdersModel {
  int? ordersId;
  int? ordersPaymentmethod;
  int? ordersUserId;
  int? ordersAddressId;
  int? ordersType;
  int? ordersPricedelivery;
  double? ordersPrice;
  double? ordersTotalprice;
  int? ordersCoupon;
  String? ordersDatetime;
  int? ordersRating;
  String? ordersNoteRating;
  int? ordersStatus;
  int? orderAddressId;
  String? orderAddressName;
  String? orderAddressCity;
  String? orderAddressStreet;
  double? orderAddressLat;
  double? orderAddressLong;
  int? orderAddressAddressId;
  int? orderAddressOrderId;
  int? couponDiscount;

  ArchiveOrdersModel({
    this.ordersId,
    this.ordersPaymentmethod,
    this.ordersUserId,
    this.ordersAddressId,
    this.ordersType,
    this.ordersPricedelivery,
    this.ordersPrice,
    this.ordersTotalprice,
    this.ordersCoupon,
    this.ordersDatetime,
    this.ordersRating,
    this.ordersNoteRating,
    this.ordersStatus,
    this.orderAddressId,
    this.orderAddressName,
    this.orderAddressCity,
    this.orderAddressStreet,
    this.orderAddressLat,
    this.orderAddressLong,
    this.orderAddressAddressId,
    this.orderAddressOrderId,
    this.couponDiscount,
  });

  factory ArchiveOrdersModel.fromJson(Map<String, dynamic> json) {
    return ArchiveOrdersModel(
      ordersId: json['orders_id'] as int?,
      ordersPaymentmethod: json['orders_paymentmethod'] as int?,
      ordersUserId: json['orders_userId'] as int?,
      ordersAddressId: json['orders_addressId'] as int?,
      ordersType: json['orders_type'] as int?,
      ordersPricedelivery: json['orders_pricedelivery'] as int?,
      ordersPrice: (json['orders_price'] as num?)?.toDouble(),
      ordersTotalprice: (json['orders_totalprice'] as num?)?.toDouble(),
      ordersCoupon: json['orders_coupon'] as int?,
      ordersDatetime: json['orders_datetime'] as String?,
      ordersRating: json['orders_rating'] as int?,
      ordersNoteRating: json['orders_noteRating'] as String?,
      ordersStatus: json['orders_status'] as int?,
      orderAddressId: json['orderAddress_id'] as int?,
      orderAddressName: json['orderAddress_name'] as String?,
      orderAddressCity: json['orderAddress_city'] as String?,
      orderAddressStreet: json['orderAddress_street'] as String?,
      orderAddressLat: (json['orderAddress_lat'] as num?)?.toDouble(),
      orderAddressLong: (json['orderAddress_long'] as num?)?.toDouble(),
      orderAddressAddressId: json['orderAddress_addressId'] as int?,
      orderAddressOrderId: json['orderAddress_orderId'] as int?,
      couponDiscount: json['coupon_discount'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'orders_id': ordersId,
        'orders_paymentmethod': ordersPaymentmethod,
        'orders_userId': ordersUserId,
        'orders_addressId': ordersAddressId,
        'orders_type': ordersType,
        'orders_pricedelivery': ordersPricedelivery,
        'orders_price': ordersPrice,
        'orders_totalprice': ordersTotalprice,
        'orders_coupon': ordersCoupon,
        'orders_datetime': ordersDatetime,
        'orders_rating': ordersRating,
        'orders_noteRating': ordersNoteRating,
        'orders_status': ordersStatus,
        'orderAddress_id': orderAddressId,
        'orderAddress_name': orderAddressName,
        'orderAddress_city': orderAddressCity,
        'orderAddress_street': orderAddressStreet,
        'orderAddress_lat': orderAddressLat,
        'orderAddress_long': orderAddressLong,
        'orderAddress_addressId': orderAddressAddressId,
        'orderAddress_orderId': orderAddressOrderId,
        'coupon_discount': couponDiscount,
      };
}

// class ArchiveOrdersModel {
//   int? ordersId;
//   int? ordersPaymentmethod;
//   int? ordersUserId;
//   int? ordersAddressId;
//   int? ordersType;
//   int? ordersPricedelivery;
//   double? ordersPrice;
//   double? ordersTotalprice;
//   int? ordersCoupon;
//   String? ordersDatetime;
//   int? ordersRating;
//   String? ordersNoteRating;
//   int? ordersStatus;
//   int? orderAddressId;
//   String? orderAddressName;
//   String? orderAddressCity;
//   String? orderAddressStreet;
//   double? orderAddressLat;
//   double? orderAddressLong;
//   int? orderAddressAddressId;

//   ArchiveOrdersModel({
//     this.ordersId,
//     this.ordersPaymentmethod,
//     this.ordersUserId,
//     this.ordersAddressId,
//     this.ordersType,
//     this.ordersPricedelivery,
//     this.ordersPrice,
//     this.ordersTotalprice,
//     this.ordersCoupon,
//     this.ordersDatetime,
//     this.ordersRating,
//     this.ordersNoteRating,
//     this.ordersStatus,
//     this.orderAddressId,
//     this.orderAddressName,
//     this.orderAddressCity,
//     this.orderAddressStreet,
//     this.orderAddressLat,
//     this.orderAddressLong,
//     this.orderAddressAddressId,
//   });

//   factory ArchiveOrdersModel.fromJson(Map<String, dynamic> json) =>
//       ArchiveOrdersModel(
//         ordersId: json['orders_id'] as int?,
//         ordersPaymentmethod: json['orders_paymentmethod'] as int?,
//         ordersUserId: json['orders_userId'] as int?,
//         ordersAddressId: json['orders_addressId'] as int?,
//         ordersType: json['orders_type'] as int?,
//         ordersPricedelivery: json['orders_pricedelivery'] as int?,
//         ordersPrice: (json['orders_price'] as num?)?.toDouble(),
//         ordersTotalprice: (json['orders_totalprice'] as num?)?.toDouble(),
//         ordersCoupon: json['orders_coupon'] as int?,
//         ordersDatetime: json['orders_datetime'] as String?,
//         ordersRating: json['orders_rating'] as int?,
//         ordersNoteRating: json['orders_noteRating'] as String?,
//         ordersStatus: json['orders_status'] as int?,
//         orderAddressId: json['orderAddress_id'] as int?,
//         orderAddressName: json['orderAddress_name'] as String?,
//         orderAddressCity: json['orderAddress_city'] as String?,
//         orderAddressStreet: json['orderAddress_street'] as String?,
//         orderAddressLat: (json['orderAddress_lat'] as num?)?.toDouble(),
//         orderAddressLong: (json['orderAddress_long'] as num?)?.toDouble(),
//         orderAddressAddressId: json['orderAddress_addressId'] as int?,
//       );

//   Map<String, dynamic> toJson() => {
//         'orders_id': ordersId,
//         'orders_paymentmethod': ordersPaymentmethod,
//         'orders_userId': ordersUserId,
//         'orders_addressId': ordersAddressId,
//         'orders_type': ordersType,
//         'orders_pricedelivery': ordersPricedelivery,
//         'orders_price': ordersPrice,
//         'orders_totalprice': ordersTotalprice,
//         'orders_coupon': ordersCoupon,
//         'orders_datetime': ordersDatetime,
//         'orders_rating': ordersRating,
//         'orders_noteRating': ordersNoteRating,
//         'orders_status': ordersStatus,
//         'orderAddress_id': orderAddressId,
//         'orderAddress_name': orderAddressName,
//         'orderAddress_city': orderAddressCity,
//         'orderAddress_street': orderAddressStreet,
//         'orderAddress_lat': orderAddressLat,
//         'orderAddress_long': orderAddressLong,
//         'orderAddress_addressId': orderAddressAddressId,
//       };
// }


// class ArchiveOrdersModel {
//   int? ordersId;
//   int? ordersPaymentmethod;
//   int? ordersUserId;
//   int? ordersAddressId;
//   int? ordersType;
//   int? ordersPricedelivery;
//   double? ordersPrice;
//   double? ordersTotalprice;
//   int? ordersCoupon;
//   String? ordersDatetime;
//   int? ordersRating;
//   String? ordersNoteRating;
//   int? ordersStatus;
//   int? addressId;
//   int? addressUsersId;
//   String? addressName;
//   String? addressCity;
//   String? addressStreet;
//   double? addressLat;
//   double? addressLong;

//   ArchiveOrdersModel({
//     this.ordersId,
//     this.ordersPaymentmethod,
//     this.ordersUserId,
//     this.ordersAddressId,
//     this.ordersType,
//     this.ordersPricedelivery,
//     this.ordersPrice,
//     this.ordersTotalprice,
//     this.ordersCoupon,
//     this.ordersDatetime,
//     this.ordersRating,
//     this.ordersNoteRating,
//     this.ordersStatus,
//     this.addressId,
//     this.addressUsersId,
//     this.addressName,
//     this.addressCity,
//     this.addressStreet,
//     this.addressLat,
//     this.addressLong,
//   });

//   factory ArchiveOrdersModel.fromJson(Map<String, dynamic> json) =>
//       ArchiveOrdersModel(
//         ordersId: json['orders_id'] as int?,
//         ordersPaymentmethod: json['orders_paymentmethod'] as int?,
//         ordersUserId: json['orders_userId'] as int?,
//         ordersAddressId: json['orders_addressId'] as int?,
//         ordersType: json['orders_type'] as int?,
//         ordersPricedelivery: json['orders_pricedelivery'] as int?,
//         ordersPrice: (json['orders_price'] as num?)?.toDouble(),
//         ordersTotalprice: (json['orders_totalprice'] as num?)?.toDouble(),
//         ordersCoupon: json['orders_coupon'] as int?,
//         ordersDatetime: json['orders_datetime'] as String?,
//         ordersRating: json['orders_rating'] as int?,
//         ordersNoteRating: json['orders_noteRating'] as String?,
//         ordersStatus: json['orders_status'] as int?,
//         addressId: json['address_id'] as int?,
//         addressUsersId: json['address_usersId'] as int?,
//         addressName: json['address_name'] as String?,
//         addressCity: json['address_city'] as String?,
//         addressStreet: json['address_street'] as String?,
//         addressLat: (json['address_lat'] as num?)?.toDouble(),
//         addressLong: (json['address_long'] as num?)?.toDouble(),
//       );

//   Map<String, dynamic> toJson() => {
//         'orders_id': ordersId,
//         'orders_paymentmethod': ordersPaymentmethod,
//         'orders_userId': ordersUserId,
//         'orders_addressId': ordersAddressId,
//         'orders_type': ordersType,
//         'orders_pricedelivery': ordersPricedelivery,
//         'orders_price': ordersPrice,
//         'orders_totalprice': ordersTotalprice,
//         'orders_coupon': ordersCoupon,
//         'orders_datetime': ordersDatetime,
//         'orders_rating': ordersRating,
//         'orders_noteRating': ordersNoteRating,
//         'orders_status': ordersStatus,
//         'address_id': addressId,
//         'address_usersId': addressUsersId,
//         'address_name': addressName,
//         'address_city': addressCity,
//         'address_street': addressStreet,
//         'address_lat': addressLat,
//         'address_long': addressLong,
//       };
// }
