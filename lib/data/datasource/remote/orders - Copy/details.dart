import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class OrderDetailsData {
  Crud crud;
  OrderDetailsData(this.crud);

  orderDetails(int orderid) async {
    var response = await crud
        .postData(AppLink.orderDetails, {"ordersid": orderid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
