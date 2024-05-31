class ViewAddressModel {
  int? addressId;
  int? addressUsersId;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;

  ViewAddressModel({
    this.addressId,
    this.addressUsersId,
    this.addressName,
    this.addressCity,
    this.addressStreet,
    this.addressLat,
    this.addressLong,
  });

  factory ViewAddressModel.fromJson(Map<String, dynamic> json) {
    return ViewAddressModel(
      addressId: json['address_id'] as int?,
      addressUsersId: json['address_usersId'] as int?,
      addressName: json['address_name'] as String?,
      addressCity: json['address_city'] as String?,
      addressStreet: json['address_street'] as String?,
      addressLat: (json['address_lat'] as num?)?.toDouble(),
      addressLong: (json['address_long'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'address_id': addressId,
        'address_usersId': addressUsersId,
        'address_name': addressName,
        'address_city': addressCity,
        'address_street': addressStreet,
        'address_lat': addressLat,
        'address_long': addressLong,
      };
}
