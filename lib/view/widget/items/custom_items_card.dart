import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardItems extends GetView<ItemsControllerImp> {
  const CardItems(
      {super.key,
      required this.image,
      required this.title,
      required this.index});
  final String image;
  final String title;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCategoryItem(index);
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
            builder: (controller) => Container(
              padding: EdgeInsetsDirectional.only(
                start: horizontalSize(10),
                end: horizontalSize(10),
                bottom: horizontalSize(5),
              ),
              //height: 5,
              decoration: index == controller.selectedCat
                  ? const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColor.primaryColor,
                          width: 3,
                        ),
                      ),
                    )
                  : null,
              child: Text(
                title,
                style: TextStyle(
                  color: AppColor.grey800,
                  fontSize: fontSize(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
