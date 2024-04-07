import 'package:ecommerce/controller/product_details_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/product_details/change_color.dart';
import 'package:ecommerce/view/widget/product_details/details_text_title.dart';
import 'package:ecommerce/view/widget/product_details/image_veiw.dart';
import 'package:ecommerce/view/widget/product_details/product_count.dart';
import 'package:ecommerce/view/widget/product_details/xxx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: CustomAddToCartBurromNavigation(
        onPressed: () {},
      ),
      body: Column(
        children: [
          const ImageVeiw(),
          verticalSizedBox(85),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: horizontalSize(16)),
              children: [
                DetailsTextTitle(title: controller.itemModel.itemsName!),
                ProductCount(
                  count: '2',
                  price: '20',
                  onAdd: () {},
                  onRemove: () {},
                ),
                Text(
                  controller.itemModel.itemsDesc!,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: AppColor.forthColor,
                      height: 1.8,
                      fontWeight: FontWeight.normal),
                ),
                const DetailsTextTitle(title: "Color"),
                const ChanegColor()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
