import 'package:ecommerce/controller/myfavorite_controller.dart';
import 'package:ecommerce/core/class/animation.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/components/search_items_list.dart';
import 'package:ecommerce/view/widget/myfavorite/custom_list_myfavorite_items.dart';
// import 'package:ecommerce/view/widget/myfavorite/search_favorite_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListMyFavorite extends StatelessWidget {
  const ListMyFavorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyFavoriteControllerImp>(
      builder: (controller) => HandlingDataView(
        isMargin: true,
        statusRequest: controller.statusRequest,
        widget: !controller.isSearch
            ? Obx(
                () => controller.count.value >= 0
                    ? Padding(
                        padding: EdgeInsets.only(top: verticalSized(20)),
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: controller.data.length,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                          ),
                          itemBuilder: (context, i) {
                            return CustomAnimation(
                              time: 500,
                              child: MyFavoriteInfo(
                                myFavoriteInfo: controller.data[i],
                              ),
                            );
                          },
                        ),
                      )
                    : HandlingDataView(
                        isMargin: true,
                        statusRequest: StatusRequest.nodata,
                        widget: Container(),
                      ),
              )
            : SearchListItems(searchitems: controller.searchItemList),
      ),
    );
  }
}
