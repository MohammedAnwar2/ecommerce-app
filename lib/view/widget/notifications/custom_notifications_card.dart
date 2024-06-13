import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/data/model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class CustomNotificationCart extends StatelessWidget {
  const CustomNotificationCart({
    super.key,
    required this.notificationsModel,
    required this.length,
  });
  final NotificationsModel notificationsModel;
  final int length;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            ListTile(
              title: Text(notificationsModel.notificationsTitle!),
              subtitle: Text(notificationsModel.notificationsBody!),
            ),
            Positioned(
                top: verticalSized(5),
                right: horizontalSize(5),
                child: Text(
                    Jiffy.parse(notificationsModel.notificationsDatetime!)
                        .add(hours: 5, minutes: 30)
                        .fromNow(),
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold)))
          ],
        ),
        if (length > 1)
          Divider(
            color: AppColor.grey200,
          )
      ],
    );
  }
}
