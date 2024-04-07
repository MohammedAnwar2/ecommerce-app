import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/product_details_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_link.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: verticalSized(200),
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          Positioned(
            top: verticalSized(50),
            right: horizontalSize(30),
            left: horizontalSize(30),
            child: Hero(
              tag: "${controller.itemModel.itemsId}",
              child: CachedNetworkImage(
                imageUrl:
                    AppLink.imageItem + "/" + controller.itemModel.itemsImage!,
                height: verticalSized(230),
                //fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
}
