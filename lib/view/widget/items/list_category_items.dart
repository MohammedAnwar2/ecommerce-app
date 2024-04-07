import 'package:ecommerce/view/widget/items/item_info.dart';
import 'package:flutter/material.dart';

class ListCategoryItems extends StatelessWidget {
  const ListCategoryItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 2,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        return const ItemInfo();
      },
    );
  }
}
