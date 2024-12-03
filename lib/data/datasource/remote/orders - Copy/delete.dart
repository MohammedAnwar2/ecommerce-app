import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class DeleteOrderData {
  Crud crud;
  DeleteOrderData(this.crud);

  deleteOrder(int orderid) async {
    var response = await crud
        .postData(AppLink.deleteOrder, {"ordersid": orderid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
