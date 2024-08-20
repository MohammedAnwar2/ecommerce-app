class Ssss {
  int? advertisementsId;
  String? advertisementsText;
  String? advertisementsTextAr;
  String? advertisementsTextRu;
  String? advertisementsImage;
  String? advertisementsTextColor;
  String? advertisementsCardordernowcolor;
  String? advertisementsCardcolor1;
  String? advertisementsCardcolor2;
  String? advertisementsIconColor;
  int? advertisementsIsonlyimage;
  String? advertisementsExpdate;

  Ssss({
    this.advertisementsId,
    this.advertisementsText,
    this.advertisementsTextAr,
    this.advertisementsTextRu,
    this.advertisementsImage,
    this.advertisementsTextColor,
    this.advertisementsCardordernowcolor,
    this.advertisementsCardcolor1,
    this.advertisementsCardcolor2,
    this.advertisementsIconColor,
    this.advertisementsIsonlyimage,
    this.advertisementsExpdate,
  });

  factory Ssss.fromJson(Map<String, dynamic> json) => Ssss(
        advertisementsId: json['advertisements_id'] as int?,
        advertisementsText: json['advertisements_text'] as String?,
        advertisementsTextAr: json['advertisements_text_ar'] as String?,
        advertisementsTextRu: json['advertisements_text_ru'] as String?,
        advertisementsImage: json['advertisements_image'] as String?,
        advertisementsTextColor: json['advertisements_textColor'] as String?,
        advertisementsCardordernowcolor:
            json['advertisements_cardordernowcolor'] as String?,
        advertisementsCardcolor1: json['advertisements_cardcolor1'] as String?,
        advertisementsCardcolor2: json['advertisements_cardcolor2'] as String?,
        advertisementsIconColor: json['advertisements_iconColor'] as String?,
        advertisementsIsonlyimage: json['advertisements_isonlyimage'] as int?,
        advertisementsExpdate: json['advertisements_expdate'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'advertisements_id': advertisementsId,
        'advertisements_text': advertisementsText,
        'advertisements_text_ar': advertisementsTextAr,
        'advertisements_text_ru': advertisementsTextRu,
        'advertisements_image': advertisementsImage,
        'advertisements_textColor': advertisementsTextColor,
        'advertisements_cardordernowcolor': advertisementsCardordernowcolor,
        'advertisements_cardcolor1': advertisementsCardcolor1,
        'advertisements_cardcolor2': advertisementsCardcolor2,
        'advertisements_iconColor': advertisementsIconColor,
        'advertisements_isonlyimage': advertisementsIsonlyimage,
        'advertisements_expdate': advertisementsExpdate,
      };
}
