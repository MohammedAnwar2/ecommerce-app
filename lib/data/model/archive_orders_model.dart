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
  int? ordersStatus;
  int? addressId;
  int? addressUsersId;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;

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
    this.ordersStatus,
    this.addressId,
    this.addressUsersId,
    this.addressName,
    this.addressCity,
    this.addressStreet,
    this.addressLat,
    this.addressLong,
  });

  factory ArchiveOrdersModel.fromJson(Map<String, dynamic> json) =>
      ArchiveOrdersModel(
        ordersId: json['orders_id'] as int?,
        ordersPaymentmethod: json['orders_paymentmethod'] as int?,
        ordersUserId: json['orders_userId'] as int?,
        ordersAddressId: json['orders_addressId'] as int?,
        ordersType: json['orders_type'] as int?,
        ordersPricedelivery: json['orders_pricedelivery'] as int?,
        ordersPrice: json['orders_price'] as double?,
        ordersTotalprice: (json['orders_totalprice'] as num?)?.toDouble(),
        ordersCoupon: json['orders_coupon'] as int?,
        ordersDatetime: json['orders_datetime'] as String?,
        ordersStatus: json['orders_status'] as int?,
        addressId: json['address_id'] as int?,
        addressUsersId: json['address_usersId'] as int?,
        addressName: json['address_name'] as String?,
        addressCity: json['address_city'] as String?,
        addressStreet: json['address_street'] as String?,
        addressLat: (json['address_lat'] as num?)?.toDouble(),
        addressLong: (json['address_long'] as num?)?.toDouble(),
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
        'address_id': addressId,
        'address_usersId': addressUsersId,
        'address_name': addressName,
        'address_city': addressCity,
        'address_street': addressStreet,
        'address_lat': addressLat,
        'address_long': addressLong,
      };
}
