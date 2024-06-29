import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/myfavorite_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_imageassets.dart';
import 'package:ecommerce/core/constant/app_link.dart';
import 'package:ecommerce/core/functions/translate_database.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:ecommerce/data/model/my_favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavoriteInfo extends StatelessWidget {
  const MyFavoriteInfo({
    super.key,
    required this.myFavoriteInfo,
  });
  final MyFavoriteModel myFavoriteInfo;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyFavoriteControllerImp>(
      builder: (controller) => GestureDetector(
        onTap: () {
          ItemModel itemModel = ItemModel();
          myFavoriteInfo.copyToItemModel(itemModel);
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
                      // SvgPicture.network(
                      //   "${AppLink.imageItem}/${itemModel.itemsImage!}",
                      //   height: 100,
                      //   fit: BoxFit.fill,
                      // ),
                      Hero(
                        tag: "${myFavoriteInfo.itemsId}",
                        child: CachedNetworkImage(
                          imageUrl:
                              "${AppLink.imageItem}/${myFavoriteInfo.itemsImage!}",
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(
                        translateDatabase(
                            columnAr: myFavoriteInfo.itemsNameAr!,
                            columnEn: myFavoriteInfo.itemsName!),
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
                          myFavoriteInfo.itemsDiscount != 0
                              ? Column(
                                  children: [
                                    Text(
                                      "${myFavoriteInfo.itemsPrice!}\$",
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
                                    //  horizontalSizedBox(10),
                                    Text(
                                      "${myFavoriteInfo.totalPrice!}\$",
                                      style: TextStyle(
                                          fontSize: fontSize(14),
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.primaryColor,
                                          fontFamily: ""),
                                    ),
                                  ],
                                )
                              : Text(
                                  "${myFavoriteInfo.itemsPrice!}\$",
                                  style: TextStyle(
                                      fontSize: fontSize(14),
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.primaryColor,
                                      fontFamily: ""),
                                ),
                          IconButton(
                            onPressed: () {
                              controller.deleteData(
                                  myFavoriteInfo.favoriteId.toString());
                              controller.favoriteController.updateFavoriteState(
                                  itemId: myFavoriteInfo.itemsId!,
                                  favoriteVal: 0);
                            },
                            icon: const Icon(
                              Icons.delete_outline_outlined,
                              color: AppColor.primaryColor,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                myFavoriteInfo.itemsDiscount != 0.0
                    ? Positioned(
                        top: 4,
                        left: 4,
                        child: Image.asset(
                          AppImages.sale,
                          height: 45,
                        ))
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
