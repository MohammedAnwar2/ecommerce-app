import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class ViewCartData {
  Crud crud;
  ViewCartData(this.crud);

  viewAllCartProducts(String userId) async {
    var response = await crud.postData(
      AppLink.viewCart,
      {
        "usersId": userId,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
