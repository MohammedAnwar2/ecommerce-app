import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  addCart(String userId, String itemId) async {
    var response = await crud.postData(
      AppLink.addCart,
      {
        "usersId": userId,
        "itemsId": itemId,
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String userId, String itemId) async {
    var response = await crud.postData(
      AppLink.deleteCart,
      {
        "usersId": userId,
        "itemsId": itemId,
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  upgradeCartCount(String userId, String itemId) async {
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
