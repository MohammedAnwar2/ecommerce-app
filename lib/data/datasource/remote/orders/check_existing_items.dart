import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class CheckExistingItemsData {
  Crud crud;
  CheckExistingItemsData(this.crud);

  checkItems(int itemsId, int currentitemscount) async {
    var response = await crud.postData(AppLink.checkExistingItems, {
      "id": itemsId.toString(),
      "currentitemscount": currentitemscount.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
