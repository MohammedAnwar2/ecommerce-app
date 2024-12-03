import 'dart:developer';
import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddFavorite extends StatelessWidget {
  const AddFavorite({
    super.key,
    required this.itemModel,
  });

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteControllerImp>(
      builder: (controller) => IconButton(
        onPressed: () {
          if (controller.isFavorite[itemModel.itemsId] == 1) {
            controller.updateFavoriteState(
                itemId: itemModel.itemsId!, favoriteVal: 0);
            controller.removeFavoriteInBackend(itemId: itemModel.itemsId!);
          } else {
            controller.updateFavoriteState(
                itemId: itemModel.itemsId!, favoriteVal: 1);
            log("${itemModel.itemsId}");
            controller.addFavoriteInBackend(itemId: itemModel.itemsId!);
          }
        },
        icon: Icon(
          controller.isFavorite[itemModel.itemsId] == 1
              ? Icons.favorite
              : Icons.favorite_border_outlined,
          color: AppColor.primaryColor,
        ),
      ),
    );
  }
}
