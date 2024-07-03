import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_imageassets.dart';
import 'package:ecommerce/core/constant/app_link.dart';
import 'package:ecommerce/core/functions/translate_database.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:ecommerce/view/widget/items/add_remove_favorite.dart';
import 'package:ecommerce/view/widget/items/custom_avaliable_card.dart';
import 'package:ecommerce/view/widget/items/custom_dissable_card.dart';
import 'package:ecommerce/view/widget/items/notify_me.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    super.key,
    required this.itemModel,
  });
  final ItemModel itemModel;
  @override
  Widget build(BuildContext context) {
    return itemModel.itemsCount != 0
        ? CustomAvaliableCard(itemModel: itemModel)
        : CustomDissableCard(itemModel: itemModel);
    // return GetBuilder<ItemsControllerImp>(
    //   builder: (controller) => ,
    //   // builder: (controller) => InkWell(
    //   //   splashColor: Colors.transparent,
    //   //   highlightColor: Colors.transparent,
    //   //   onTap: itemModel.itemsCount != 0
    //   //       ? () {
    //   //           controller.goToProductDetails(itemModel);
    //   //         }
    //   //       : null,
    //   //   child: Card(
    //   //     elevation: 5,
    //   //     child: Container(
    //   //       decoration: BoxDecoration(
    //   //           color: itemModel.itemsCount != 0
    //   //               ? AppColor.white
    //   //               : AppColor.grey200,
    //   //           borderRadius: BorderRadius.circular(12)),
    //   //       child: Stack(
    //   //         children: [
    //   //           Padding(
    //   //             padding: const EdgeInsets.all(8.0),
    //   //             child: Column(
    //   //               mainAxisAlignment: MainAxisAlignment.center,
    //   //               children: [
    //   //                 Hero(
    //   //                   tag: "${itemModel.itemsId}",
    //   //                   child: CachedNetworkImage(
    //   //                     imageUrl:
    //   //                         "${AppLink.imageItem}/${itemModel.itemsImage!}",
    //   //                     height: 100,
    //   //                     fit: BoxFit.fill,
    //   //                   ),
    //   //                 ),
    //   //                 Text(
    //   //                   translateDatabase(
    //   //                       columnAr: itemModel.itemsNameAr!,
    //   //                       columnEn: itemModel.itemsName!),
    //   //                   style: TextStyle(
    //   //                     fontSize: fontSize(14),
    //   //                     fontWeight: FontWeight.bold,
    //   //                     color: AppColor.grey800,
    //   //                   ),
    //   //                   overflow: TextOverflow.ellipsis,
    //   //                 ),
    //   //                 itemModel.itemsCount != 0
    //   //                     ? Row(children: [
    //   //                         const Text("Rating 3.5 "),
    //   //                         const Spacer(),
    //   //                         ...List.generate(
    //   //                           5,
    //   //                           (index) => Container(
    //   //                             height: verticalSized(15),
    //   //                             alignment: Alignment.bottomCenter,
    //   //                             child: const Icon(
    //   //                               Icons.star,
    //   //                               size: 15,
    //   //                             ),
    //   //                           ),
    //   //                         ),
    //   //                       ])
    //   //                     : Row(
    //   //                         mainAxisAlignment: MainAxisAlignment.start,
    //   //                         children: [
    //   //                           Card(
    //   //                               child: Padding(
    //   //                             padding: EdgeInsets.symmetric(
    //   //                                 horizontal: horizontalSize(5)),
    //   //                             child: Text(
    //   //                               "Out of stock",
    //   //                               style: TextStyle(
    //   //                                   fontSize: fontSize(10),
    //   //                                   fontWeight: FontWeight.bold,
    //   //                                   color: AppColor.black),
    //   //                             ),
    //   //                           )),
    //   //                         ],
    //   //                       ),
    //   //                 Row(
    //   //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   //                   children: [
    //   //                     itemModel.itemsDiscount != 0.0
    //   //                         ? Column(
    //   //                             mainAxisSize: MainAxisSize.min,
    //   //                             children: [
    //   //                               Text(
    //   //                                 "${itemModel.itemsPrice!}\$",
    //   //                                 style: TextStyle(
    //   //                                   fontSize: fontSize(11),
    //   //                                   fontWeight: FontWeight.bold,
    //   //                                   color: AppColor.black,
    //   //                                   fontFamily: "",
    //   //                                   decoration: TextDecoration.lineThrough,
    //   //                                   decorationColor: AppColor
    //   //                                       .primaryColor, // Color of the line
    //   //                                   decorationThickness: 3.0,
    //   //                                 ),
    //   //                               ),
    //   //                               //horizontalSizedBox(10),
    //   //                               Text(
    //   //                                 "${itemModel.itemspricediscount!}\$",
    //   //                                 style: TextStyle(
    //   //                                     fontSize: fontSize(14),
    //   //                                     fontWeight: FontWeight.bold,
    //   //                                     color: AppColor.primaryColor,
    //   //                                     fontFamily: ""),
    //   //                               ),
    //   //                             ],
    //   //                           )
    //   //                         : Text(
    //   //                             "${itemModel.itemspricediscount!}\$",
    //   //                             style: TextStyle(
    //   //                                 fontSize: fontSize(16),
    //   //                                 fontWeight: FontWeight.bold,
    //   //                                 color: AppColor.primaryColor,
    //   //                                 fontFamily: ""),
    //   //                           ),
    //   //                     itemModel.itemsCount != 0
    //   //                         ? AddFavorite(itemModel: itemModel)
    //   //                         : NotifyMe(itemModel: itemModel)
    //   //                   ],
    //   //                 )
    //   //               ],
    //   //             ),
    //   //           ),
    //   //           itemModel.itemsDiscount != 0.0
    //   //               ? Positioned(
    //   //                   top: 4,
    //   //                   left: 4,
    //   //                   child: Image.asset(
    //   //                     AppImages.sale,
    //   //                     height: 45,
    //   //                   ))
    //   //               : Container()
    //   //         ],
    //   //       ),
    //   //     ),
    //   //   ),
    //   // ),
    // );
  }
}
