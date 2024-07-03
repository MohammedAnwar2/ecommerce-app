import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class NotifymeData {
  Crud crud;
  NotifymeData(this.crud);

  notifyMe(String itemsid, String userId) async {
    var response = await crud.postData(
      AppLink.notifyme,
      {
        "itemsid": itemsid,
        "usersid": userId,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
