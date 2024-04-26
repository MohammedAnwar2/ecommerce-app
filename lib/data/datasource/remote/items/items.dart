import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  postData(String categoryId, String userId) async {
    var response = await crud.postData(
      AppLink.items,
      {
        "categoryId": categoryId,
        "userId": userId,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
