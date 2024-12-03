import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class ReturnItemsValueData {
  Crud crud;
  ReturnItemsValueData(this.crud);

  returnItemsValue(int itemsId, int currentitemscount) async {
    var response = await crud.postData(AppLink.returnsItemsValuesAgain, {
      "id": itemsId.toString(),
      "currentitemscount": currentitemscount.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
