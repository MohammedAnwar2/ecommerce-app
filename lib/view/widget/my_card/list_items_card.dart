import 'package:ecommerce/controller/my_card_controller.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/my_card/item_card_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsCard extends GetView<MyCardControllerImp> {
  const ListItemsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsetsDirectional.only(top: verticalSized(15)),
      itemCount: controller.data.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int i) {
        return ItemCardInfo(viewCartProductsModel: controller.data[i]);
      },
    );
  }
}
