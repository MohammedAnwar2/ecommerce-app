import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/data/datasource/remote/notification/delete.dart';
import 'package:ecommerce/data/datasource/remote/notification/view.dart';
import 'package:ecommerce/data/model/notification_model.dart';
import 'package:get/get.dart';
//viewNotifications

mixin ViewNotificationMethods {
  viewNotificarions();
  refereshNotificarions();
  deleteNotifications(int index, int idNotify);
  initData();
}

mixin ViewNotificationVariables {
  late int id;
  StatusRequest statusRequest = StatusRequest.success;
  ViewNotificationsData viewnotification = ViewNotificationsData(Get.find());
  DeleteNotificationsData deletenotification =
      DeleteNotificationsData(Get.find());
  MyServices services = Get.find<MyServices>();
  List<NotificationsModel> notificationsList = [];
}

class ViewNotificationControllerImp extends GetxController
    with ViewNotificationMethods, ViewNotificationVariables {
  @override
  viewNotificarions() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewnotification.viewNotifications(id);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        notificationsList.clear();
        List data = response['data'];
        notificationsList
            .addAll(data.map((e) => NotificationsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.nodata;
      }
    }

    update();
  }

  @override
  void onInit() {
    initData();
    viewNotificarions();
    super.onInit();
  }

  @override
  initData() {
    id = services.sharePref.getInt(AppKey.usersId)!;
  }

  @override
  refereshNotificarions() async {
    await viewNotificarions();
  }

  @override
  deleteNotifications(int index, int idNotify) {
    deletenotification.deleteNotifications(idNotify);
    notificationsList.removeAt(index);
    if (notificationsList.isEmpty) {
      statusRequest = StatusRequest.nodata;
    }
    update();
  }
}
