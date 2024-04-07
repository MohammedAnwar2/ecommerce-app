import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/view/widget/items/item_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItems extends GetView<ItemsControllerImp> {
  const ListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: GridView.builder(
          shrinkWrap: true,
          itemCount: controller.itemModelList.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, i) {
            return ItemInfo(
              itemModel: controller.itemModelList[i],
            );
          },
        ),
      ),
    );
  }
}
