class AdsModel {
  int? adsId;
  String? adsImage;
  String? adsExpire;

  AdsModel({this.adsId, this.adsImage, this.adsExpire});

  factory AdsModel.fromJson(Map<String, dynamic> json) => AdsModel(
        adsId: json['ads_id'] as int?,
        adsImage: json['ads_image'] as String?,
        adsExpire: json['ads_expire'] as String?,
      );
}
