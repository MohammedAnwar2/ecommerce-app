import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/view_offers_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_imageassets.dart';
import 'package:ecommerce/core/constant/app_link.dart';
import 'package:ecommerce/core/functions/translate_database.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemOffersInfo extends StatelessWidget {
  const ItemOffersInfo({
    super.key,
    required this.itemModel,
  });
  final ItemModel itemModel;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewOffersControllerImp>(
      builder: (controller) => InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          controller.goToProductDetails(itemModel);
        },
        child: Card(
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
                color: AppColor.white, borderRadius: BorderRadius.circular(12)),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: "${itemModel.itemsId}",
                        child: CachedNetworkImage(
                          imageUrl:
                              "${AppLink.imageItem}/${itemModel.itemsImage!}",
                          height: 100,
                          fit: BoxFit.fill,
                        ),
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
                            child: Icon(
                              Icons.star,
                              size: 15.r,
                            ),
                          ),
                        ),
                      ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "${itemModel.itemsPrice!}\$",
                                style: TextStyle(
                                  fontSize: fontSize(11),
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.black,
                                  fontFamily: "",
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: AppColor
                                      .primaryColor, // Color of the line
                                  decorationThickness: 3.0,
                                ),
                              ),
                              horizontalSizedBox(10),
                              Text(
                                "${itemModel.itemspricediscount!}\$",
                                style: TextStyle(
                                    fontSize: fontSize(14),
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryColor,
                                    fontFamily: ""),
                              ),
                            ],
                          ),
                          GetBuilder<FavoriteControllerImp>(
                            // GetBuilder<FavoriteControllerImp>(
                            builder: (controller) => IconButton(
                              onPressed: () {
                                if (controller.isFavorite[itemModel.itemsId] ==
                                    1) {
                                  controller.updateFavoriteState(
                                      itemId: itemModel.itemsId!,
                                      favoriteVal: 0);
                                  controller.removeFavoriteInBackend(
                                      itemId: itemModel.itemsId!);
                                } else {
                                  controller.updateFavoriteState(
                                      itemId: itemModel.itemsId!,
                                      favoriteVal: 1);
                                  log("${itemModel.itemsId}");
                                  controller.addFavoriteInBackend(
                                      itemId: itemModel.itemsId!);
                                }
                              },
                              icon: Icon(
                                controller.isFavorite[itemModel.itemsId] == 1
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: AppColor.primaryColor,
                                size: 25.r,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 4,
                  left: 4,
                  child: Image.asset(
                    AppImages.sale,
                    height: 45,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
