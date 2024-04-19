import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/my_card/item_card_info.dart';
import 'package:flutter/material.dart';

class ListItemsCard extends StatelessWidget {
  const ListItemsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsetsDirectional.only(top: verticalSized(15)),
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return ItemCardInfo();
      },
    );
  }
}
