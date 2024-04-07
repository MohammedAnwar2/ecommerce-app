import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_link.dart';
import 'package:ecommerce/core/functions/translate_database.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    super.key,
    required this.itemModel,
  });
  final ItemModel itemModel;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(
      builder: (controller) => Card(
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
              color: AppColor.white, borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SvgPicture.network(
                //   "${AppLink.imageItem}/${itemModel.itemsImage!}",
                //   height: 100,
                //   fit: BoxFit.fill,
                // ),
                CachedNetworkImage(
                  imageUrl: "${AppLink.imageItem}/${itemModel.itemsImage!}",
                  height: 100,
                  fit: BoxFit.fill,
                ),
                Text(
                  translateDatabase(
                      columnAr: itemModel.itemsNameAr!,
                      columnEn: itemModel.itemsName!),
                  style: TextStyle(
                    fontSize: fontSize(14),
                    fontWeight: FontWeight.bold,
                    color: AppColor.grey800,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Row(children: [
                  const Text("Rating 3.5 "),
                  const Spacer(),
                  ...List.generate(
                    5,
                    (index) => Container(
                      height: verticalSized(15),
                      alignment: Alignment.bottomCenter,
                      child: const Icon(
                        Icons.star,
                        size: 15,
                      ),
                    ),
                  ),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${itemModel.itemsPrice!}\$",
                      style: TextStyle(
                          fontSize: fontSize(16),
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor,
                          fontFamily: ""),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: AppColor.primaryColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
