import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/home_page_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_link.dart';
import 'package:ecommerce/core/functions/translate_database.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemInfoHome extends GetView<HomePageControllerImp> {
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
          child: CachedNetworkImage(
            imageUrl: "${AppLink.imageItem}/${itemModel.itemsImage}",
            height: verticalSized(100),
            width: horizontalSize(150),
            //fit: BoxFit.fill,
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
          right: horizontalSize(10),
          child: Text(
            translateDatabase(
                columnAr: itemModel.itemsNameAr!,
                columnEn: itemModel.itemsName!),
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
