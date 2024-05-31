class PendingOrdersModel {
  int? ordersId;
  int? ordersPaymentmethod;
  int? ordersUserId;
  int? ordersAddressId;
  int? ordersType;
  int? ordersPricedelivery;
  int? ordersPrice;
  double? ordersTotalprice;
  int? ordersCoupon;
  String? ordersDatetime;
  int? ordersStatus;

  PendingOrdersModel({
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
    this.ordersStatus,
  });

  factory PendingOrdersModel.fromJson(Map<String, dynamic> json) =>
      PendingOrdersModel(
        ordersId: json['orders_id'] as int?,
        ordersPaymentmethod: json['orders_paymentmethod'] as int?,
        ordersUserId: json['orders_userId'] as int?,
        ordersAddressId: json['orders_addressId'] as int?,
        ordersType: json['orders_type'] as int?,
        ordersPricedelivery: json['orders_pricedelivery'] as int?,
        ordersPrice: json['orders_price'] as int?,
        ordersTotalprice: (json['orders_totalprice'] as num?)?.toDouble(),
        ordersCoupon: json['orders_coupon'] as int?,
        ordersDatetime: json['orders_datetime'] as String?,
        ordersStatus: json['orders_status'] as int?,
      );

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
        'orders_status': ordersStatus,
      };
}
