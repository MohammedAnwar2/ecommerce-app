import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/my_card_controller.dart';
import 'package:ecommerce/core/constant/app_link.dart';
import 'package:ecommerce/core/functions/show_tost.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/data/model/view_cart_all_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemCardInfo extends GetView<MyCardControllerImp> {
  const ItemCardInfo({
    super.key,
    required this.viewCartProductsModel,
  });
  final ViewCartProductsModel viewCartProductsModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      // height: verticalSized(80),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl:
                    "${AppLink.imageItem}/${viewCartProductsModel.itemsImage}",
                height: verticalSized(90),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ListTile(
              title: Text(
                viewCartProductsModel.itemsName!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text("${viewCartProductsModel.totalPrice}\$"),
            ),
          ),
          //const Spacer(),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: verticalSized(38),
                    child: IconButton(
                        onPressed: () async {
                          await controller.add(viewCartProductsModel);
                          // await controller.addData(
                          //     viewCartProductsModel.itemsId.toString(),
                          //     viewCartProductsModel.itemsPrice.toString());
                          // controller.refreshView();
                        },
                        icon: const Icon(Icons.add))),
                Text(
                  viewCartProductsModel.currentItemsCount.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontFamily: ""),
                ),
                SizedBox(
                    height: verticalSized(36),
                    child: IconButton(
                        onPressed: () async {
                          await controller.deleteData(
                              viewCartProductsModel.itemsId.toString());
                          controller.refreshView();
                        },
                        icon: const Icon(Icons.minimize))),
              ],
            ),
          ),
          Container(
            width: horizontalSize(10),
          )
        ],
      ),
    );
  }
}
