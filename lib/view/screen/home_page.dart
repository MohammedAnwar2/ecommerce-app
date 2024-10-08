import 'package:ecommerce/controller/home_page_controller.dart';
import 'package:ecommerce/core/class/animation.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/components/search_items_list.dart';
import 'package:ecommerce/view/widget/home/categories_list.dart';
import 'package:ecommerce/view/components/custom_appbar.dart';
import 'package:ecommerce/view/widget/home/custom_cashback_card.dart';
import 'package:ecommerce/view/widget/home/custom_text.dart';
import 'package:ecommerce/view/widget/home/product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final homePageController = Get.put(HomePageControllerImp());

    return GetBuilder<HomePageControllerImp>(
      builder: (controller) => SafeArea(
        child: Container(
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: horizontalSize(16)),
          child: ListView(
            padding: EdgeInsetsDirectional.only(top: verticalSized(10)),
            children: [
              CustomAnimationLeftToRight(
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
                      : Container(
                          height: 0,
                          width: 0,
                        ),
                ),
              ),
              HandlingDataView(
                isMargin: true,
                statusRequest: controller.statusRequest,
                widget: !controller.isSearch
                    ? ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          verticalSizedBox(16),

                          CustomCardCashBackHome(
                              title: homePageController
                                  .strings.first.stringsTitle!,
                              subTitle: homePageController
                                  .strings.first.stringsBody!),
                          CustomAnimation(child: verticalSizedBox(5)),
                          CustomAnimation(
                            child: CustomText(
                              text: "63".tr,
                            ),
                          ),
                          const ListCategoriesHome(),
                          CustomAnimation(
                            child: CustomText(
                              text: "69".tr,
                            ),
                          ),
                          CustomAnimation(child: verticalSizedBox(10)),
                          const ListProductItem(),
                          // CustomAnimation(
                          //   child: CustomText(
                          //     text: "65".tr,
                          //   ),
                          // ),
                          // verticalSizedBox(10),
                          // const ListProductItem()
                        ],
                      )
                    : SearchListItems(searchitems: controller.searchItemList),
              )
            ],
          ),
        ),
      ),
    ); //------------
  }
}
