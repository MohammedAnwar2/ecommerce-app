import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class ViewNotificationsData {
  Crud crud;
  ViewNotificationsData(this.crud);

  viewNotifications(int userId) async {
    var response = await crud
        .postData(AppLink.viewNotifications, {"usersid": userId.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
