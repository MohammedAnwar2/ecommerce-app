import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class AddCartData {
  Crud crud;
  AddCartData(this.crud);

  addCart(String userId, String itemId, String itemprice) async {
    var response = await crud.postData(
      AppLink.addCart,
      {"usersId": userId, "itemsId": itemId, "itemprice": itemprice},
    );
    return response.fold((l) => l, (r) => r);
  }
}
