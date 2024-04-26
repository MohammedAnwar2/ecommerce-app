import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class AddCartData {
  Crud crud;
  AddCartData(this.crud);

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
}
