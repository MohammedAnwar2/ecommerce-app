import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifyMe extends StatelessWidget {
  const NotifyMe({super.key, required this.itemModel});
  final ItemModel itemModel;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(
      builder: (controller) {
        return MaterialButton(
            splashColor: Colors.transparent, // Removes the splash color
            highlightColor: Colors.transparent,
            padding: EdgeInsets.zero,
            minWidth: 0,
            onPressed: controller.isNotify[itemModel.itemsId] == 0
                ? () {
                    if (controller.isNotify[itemModel.itemsId] == 0) {
                      controller.updateNotifyMeState(
                          itemId: itemModel.itemsId!, notifyMeState: 1);
                      controller.updateNotifyMeInBackend(
                          itemId: itemModel.itemsId!);
                    }
                  }
                : null,
            child: controller.isNotify[itemModel.itemsId] == 0
                ? Card(
                    child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: horizontalSize(10)),
                    child: Text("Notify Me",
                        style: TextStyle(
                            fontSize: fontSize(12),
                            color: AppColor.black,
                            fontWeight: FontWeight.bold)),
                  ))
                : Icon(Icons.notification_add));
      },
    );
  }
}
