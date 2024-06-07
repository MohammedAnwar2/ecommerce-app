import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/view_offers_controller.dart';
import 'package:ecommerce/core/class/animation.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/components/custom_appbar.dart';
import 'package:ecommerce/view/components/search_items_list.dart';
import 'package:ecommerce/view/widget/offers/item_offers_Info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ViewOffersControllerImp());
    Get.put(FavoriteControllerImp());
    return Padding(
      padding: EdgeInsets.only(
          left: horizontalSize(16),
          right: horizontalSize(16),
          top: horizontalSize(8)),
      child: Column(
        children: [
          CustomFadeTransitionAnimation(
            time: 500,
            child: CustomAppBar(
              myController: controller.search,
              onChanged: (val) {
                controller.onChangeSearch(val);
              },
              hintText: "62".tr,
              onPressedSearch: () {
                controller.onClickSearch();
              },
              onPressedFavorite: () {
                controller.goToMyFavorite();
              },
              suffixIcon: controller.isTyping
                  ? IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        controller.deleteText();
                      },
                    )
                  : const SizedBox(
                      height: 0,
                      width: 0,
                    ),
            ),
          ),
          Expanded(child: GetBuilder<ViewOffersControllerImp>(
            builder: (controller) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: !controller.isSearch
                    ? CustomAnimation(
                        child: ListView.builder(
                          padding: EdgeInsets.only(
                              top: verticalSized(8), bottom: verticalSized(24)),
                          itemCount: controller.offersList.length,
                          itemBuilder: (context, i) {
                            return ItemOffersInfo(
                                itemModel: controller.offersList[i]);
                          },
                        ),
                      )
                    : SearchListItems(searchitems: controller.searchItemList),
              );
              // widget: ItemInfo(itemModel: controller.offersList[i]));
            },
          ))
        ],
      ),
    );
  }
}



/*

*/