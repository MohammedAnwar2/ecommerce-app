import 'package:ecommerce/controller/notifications/view_notifications_controller.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/notifications/custom_notification_appbar.dart';
import 'package:ecommerce/view/widget/notifications/notification_card_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewNotificationControllerImp());
    return GetBuilder<ViewNotificationControllerImp>(
      builder: (controller) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: horizontalSize(8)),
          child: const Column(
            children: [
              CustomNotificationAppBar(),
              Expanded(
                child: NotificationCardList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
