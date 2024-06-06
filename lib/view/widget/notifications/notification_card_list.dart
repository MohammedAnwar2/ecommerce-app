import 'package:ecommerce/controller/notifications/view_notifications_controller.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/view/widget/notifications/custom_notifications_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NotificationCardList extends StatelessWidget {
  const NotificationCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewNotificationControllerImp>(builder: (controller) {
      return HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: ListView.builder(
          itemCount: controller.notificationsList.length,
          itemBuilder: (context, i) {
            return Dismissible(
              key: Key(
                  controller.notificationsList[i].notificationsId.toString()),
              direction: DismissDirection.horizontal,
              onDismissed: (direction) {
                controller.deleteNotifications(
                    i, controller.notificationsList[i].notificationsId!);
              },
              child: CustomNotificationCart(
                  length: controller.notificationsList.length,
                  notificationsModel: controller.notificationsList[i]),
            );
          },
        ),
      );
    });
  }
}
