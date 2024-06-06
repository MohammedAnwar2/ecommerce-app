import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class DeleteNotificationsData {
  Crud crud;
  DeleteNotificationsData(this.crud);

  deleteNotifications(int userId) async {
    var response = await crud.postData(
        AppLink.deleteNotifications, {"notificationsid": userId.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
