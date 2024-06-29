class OrdersModel {
  int? ordersId;
  int? ordersPaymentmethod;
  int? ordersUserId;
  int? ordersAddressId;
  int? ordersType;
  int? ordersDeliveryid;
  int? ordersPricedelivery;
  double? ordersPrice;
  double? ordersTotalprice;
  int? ordersCoupon;
  String? ordersDatetime;
  int? ordersRating;
  String? ordersNoteRating;
  int? ordersStatus;
  dynamic orderAddressId;
  dynamic orderAddressName;
  dynamic orderAddressCity;
  dynamic orderAddressStreet;
  dynamic orderAddressLat;
  dynamic orderAddressLong;
  dynamic orderAddressAddressId;
  dynamic orderAddressOrderId;
  dynamic couponDiscount;

  OrdersModel({
    this.ordersId,
    this.ordersPaymentmethod,
    this.ordersUserId,
    this.ordersAddressId,
    this.ordersType,
    this.ordersDeliveryid,
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

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
        ordersId: json['orders_id'] as int?,
        ordersPaymentmethod: json['orders_paymentmethod'] as int?,
        ordersUserId: json['orders_userId'] as int?,
        ordersAddressId: json['orders_addressId'] as int?,
        ordersType: json['orders_type'] as int?,
        ordersDeliveryid: json['orders_deliveryid'] as int?,
        ordersPricedelivery: json['orders_pricedelivery'] as int?,
        ordersPrice: (json['orders_price'] as num?)?.toDouble(),
        ordersTotalprice: (json['orders_totalprice'] as num?)?.toDouble(),
        ordersCoupon: json['orders_coupon'] as int?,
        ordersDatetime: json['orders_datetime'] as String?,
        ordersRating: json['orders_rating'] as int?,
        ordersNoteRating: json['orders_noteRating'] as String?,
        ordersStatus: json['orders_status'] as int?,
        orderAddressId: json['orderAddress_id'] as dynamic,
        orderAddressName: json['orderAddress_name'] as dynamic,
        orderAddressCity: json['orderAddress_city'] as dynamic,
        orderAddressStreet: json['orderAddress_street'] as dynamic,
        orderAddressLat: json['orderAddress_lat'] as dynamic,
        orderAddressLong: json['orderAddress_long'] as dynamic,
        orderAddressAddressId: json['orderAddress_addressId'] as dynamic,
        orderAddressOrderId: json['orderAddress_orderId'] as dynamic,
        couponDiscount: json['coupon_discount'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'orders_id': ordersId,
        'orders_paymentmethod': ordersPaymentmethod,
        'orders_userId': ordersUserId,
        'orders_addressId': ordersAddressId,
        'orders_type': ordersType,
        'orders_deliveryid': ordersDeliveryid,
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
