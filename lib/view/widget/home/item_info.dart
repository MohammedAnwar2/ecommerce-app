import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_link.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemInfoHome extends StatelessWidget {
  const ItemInfoHome({
    super.key,
    required this.itemModel,
  });
  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal: horizontalSize(10)),
          child: SvgPicture.network(
            "${AppLink.imageItem}/${itemModel.itemsImage}",
            height: verticalSized(100),
            width: horizontalSize(150),
            fit: BoxFit.fill,
          ),
        ),
        Container(
          height: verticalSized(120),
          width: verticalSized(180),
          decoration: BoxDecoration(
              color: AppColor.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(24)),
        ),
        Positioned(
          left: horizontalSize(10),
          child: Text(
            itemModel.itemsName!,
            style: TextStyle(
                fontSize: fontSize(14),
                color: AppColor.white,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
