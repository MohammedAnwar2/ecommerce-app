import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class RatingData {
  Crud crud;
  RatingData(this.crud);

  ratingOrder(int odersid, double ratingValue, String ratingNote) async {
    var response = await crud.postData(AppLink.rating, {
      "odersid": odersid.toString(),
      "ratingValue": ratingValue.toString(),
      "ratingNote": ratingNote,
    });
    return response.fold((l) => l, (r) => r);
  }
}
