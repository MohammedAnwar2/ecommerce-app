import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class DecreaseItemsData {
  Crud crud;
  DecreaseItemsData(this.crud);

  decreaseItems(int itemsId, int currentitemscount) async {
    var response = await crud.postData(AppLink.decreseItems, {
      "id": itemsId.toString(),
      "currentitemscount": currentitemscount.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
