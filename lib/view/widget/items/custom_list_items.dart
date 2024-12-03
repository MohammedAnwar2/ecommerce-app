import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/class/animation.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/view/components/search_items_list.dart';
import 'package:ecommerce/view/widget/items/item_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItems extends GetView<ItemsControllerImp> {
  const ListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    FavoriteControllerImp favController = Get.find<FavoriteControllerImp>();
    ItemsControllerImp notifyController = Get.find<ItemsControllerImp>();
    return GetBuilder<ItemsControllerImp>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: !controller.isSearch
            ? GridView.builder(
                shrinkWrap: true,
                itemCount: controller.itemModelList.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, i) {
                  favController.updateFavoriteState(
                      itemId: controller.itemModelList[i].itemsId!,
                      favoriteVal: controller.itemModelList[i].favorite!);

                  return CustomAnimation(
                    time: 500,
                    child: ItemInfo(
                      itemModel: controller.itemModelList[i],
                    ),
                  );
                },
              )
            : SearchListItems(searchitems: controller.searchItemList),
      ),
    );
  }
}
