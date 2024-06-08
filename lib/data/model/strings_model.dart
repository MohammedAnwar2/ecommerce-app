class StringsModel {
  int? stringsId;
  String? stringsTitle;
  String? stringsBody;

  StringsModel({this.stringsId, this.stringsTitle, this.stringsBody});

  factory StringsModel.fromJson(Map<String, dynamic> json) => StringsModel(
        stringsId: json['strings_id'] as int?,
        stringsTitle: json['strings_title'] as String?,
        stringsBody: json['strings_body'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'strings_id': stringsId,
        'strings_title': stringsTitle,
        'strings_body': stringsBody,
      };
}
