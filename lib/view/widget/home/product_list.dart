import 'package:ecommerce/controller/home_page_controller.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/home/item_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListProductItem extends GetView<HomePageControllerImp> {
  const ListProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: verticalSized(130),
      child: ListView.separated(
        itemBuilder: (context, i) => ItemInfoHome(
            image: controller.itemModelList[i].itemsImage!,
            name: controller.itemModelList[i].itemsName!),
        separatorBuilder: (context, index) => horizontalSizedBox(10),
        itemCount: controller.itemModelList.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
