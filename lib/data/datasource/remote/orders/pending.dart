import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class PendingData {
  Crud crud;
  PendingData(this.crud);

  pendingOrder(int userId) async {
    var response =
        await crud.postData(AppLink.checkout, {"userid": userId.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
