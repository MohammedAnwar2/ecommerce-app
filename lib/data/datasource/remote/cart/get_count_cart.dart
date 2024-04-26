import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class CoutCartData {
  Crud crud;
  CoutCartData(this.crud);
  getCartCount(String userId, String itemId) async {
    var response = await crud.postData(
      AppLink.getCountItems,
      {
        "usersId": userId,
        "itemsId": itemId,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
