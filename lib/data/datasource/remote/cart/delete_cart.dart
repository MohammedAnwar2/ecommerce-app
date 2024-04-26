import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class DeleteCartData {
  Crud crud;
  DeleteCartData(this.crud);

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
}
