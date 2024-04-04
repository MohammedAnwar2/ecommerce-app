class ItemModel {
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
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;

  ItemModel(
      {this.itemsId,
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
      this.itemsCat,
      this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesDatetime});

  ItemModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_image'] = categoriesImage;
    data['categories_datetime'] = categoriesDatetime;
    return data;
  }
}

// // ignore_for_file: public_member_api_docs, sort_constructors_first

// class ItemModel {
//   int? itemsId;
//   String? itemsName;
//   String? itemsNameAr;
//   String? itemsDesc;
//   String? itemsDescAr;
//   String? itemsImage;
//   int? itemsCount;
//   int? itemsActive;
//   double? itemsPrice;
//   int? itemsDiscount;
//   String? itemsDate;
//   int? itemsCat;
//   ItemModel({
//     this.itemsId,
//     this.itemsName,
//     this.itemsNameAr,
//     this.itemsDesc,
//     this.itemsDescAr,
//     this.itemsImage,
//     this.itemsCount,
//     this.itemsActive,
//     this.itemsPrice,
//     this.itemsDiscount,
//     this.itemsDate,
//     this.itemsCat,
//   });

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['items_id'] = itemsId;
//     data['items_name'] = itemsName;
//     data['items_name_ar'] = itemsNameAr;
//     data['items_desc'] = itemsDesc;
//     data['items_desc_ar'] = itemsDescAr;
//     data['items_image'] = itemsImage;
//     data['items_count'] = itemsCount;
//     data['items_active'] = itemsActive;
//     data['items_price'] = itemsPrice;
//     data['items_discount'] = itemsDiscount;
//     data['items_date'] = itemsDate;
//     data['items_cat'] = itemsCat;
//     return data;
//   }

//   factory ItemModel.fromJson(Map<String, dynamic> map) {
//     return ItemModel(
//       itemsId: map['items_id'],
//       itemsName: map['items_name'],
//       itemsNameAr: map['items_name_ar'],
//       itemsDesc: map['items_desc'],
//       itemsDescAr: map['items_desc_ar'],
//       itemsImage: map['items_image'],
//       itemsCount: map['items_count'],
//       itemsActive: map['items_active'],
//       itemsPrice: map['items_price'],
//       itemsDiscount: map['items_discount'],
//       itemsDate: map['items_date'],
//       itemsCat: map['items_cat'],
//     );
//   }
// }

// // class ItemModel {
// //   int? itemsId;
// //   String? itemsName;
// //   String? itemsNameAr;
// //   String? itemsDesc;
// //   String? itemsDescAr;
// //   String? itemsImage;
// //   int? itemsCount;
// //   int? itemsActive;
// //   double? itemsPrice;
// //   int? itemsDiscount;
// //   String? itemsDate;
// //   int? itemsCat;

// //   ItemModel(
// //       {this.itemsId,
// //       this.itemsName,
// //       this.itemsNameAr,
// //       this.itemsDesc,
// //       this.itemsDescAr,
// //       this.itemsImage,
// //       this.itemsCount,
// //       this.itemsActive,
// //       this.itemsPrice,
// //       this.itemsDiscount,
// //       this.itemsDate,
// //       this.itemsCat});

// //   ItemModel.fromJson(Map<String, dynamic> json) {
// //     itemsId = json['items_id'];
// //     itemsName = json['items_name'];
// //     itemsNameAr = json['items_name_ar'];
// //     itemsDesc = json['items_desc'];
// //     itemsDescAr = json['items_desc_ar'];
// //     itemsImage = json['items_image'];
// //     itemsCount = json['items_count'];
// //     itemsActive = json['items_active'];
// //     itemsPrice = json['items_price'];
// //     itemsDiscount = json['items_discount'];
// //     itemsDate = json['items_date'];
// //     itemsCat = json['items_cat'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['items_id'] = this.itemsId;
// //     data['items_name'] = this.itemsName;
// //     data['items_name_ar'] = this.itemsNameAr;
// //     data['items_desc'] = this.itemsDesc;
// //     data['items_desc_ar'] = this.itemsDescAr;
// //     data['items_image'] = this.itemsImage;
// //     data['items_count'] = this.itemsCount;
// //     data['items_active'] = this.itemsActive;
// //     data['items_price'] = this.itemsPrice;
// //     data['items_discount'] = this.itemsDiscount;
// //     data['items_date'] = this.itemsDate;
// //     data['items_cat'] = this.itemsCat;
// //     return data;
// //   }
// // }