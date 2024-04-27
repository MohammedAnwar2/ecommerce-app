import 'package:ecommerce/controller/myfavorite_controller.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/components/custom_appbar.dart';
import 'package:ecommerce/view/widget/myfavorite/myfavorite_items_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    MyFavoriteControllerImp controller = Get.put(MyFavoriteControllerImp());
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size(0, 0), child: AppBar()),
      body: ListView(
        padding: EdgeInsetsDirectional.symmetric(
            vertical: verticalSized(10), horizontal: horizontalSize(16)),
        children: [
          CustomAppBar(
            myController: controller.search,
            onChanged: (val) {
              controller.onChangeSearch(val);
            },
            hintText: "62".tr,
            onPressedSearch: () {
              controller.onClickSearch();
            },
            isThereFavorite: false,
          ),
          verticalSizedBox(20),
          const ListMyFavorite()
        ],
      ),
    );
  }
}
