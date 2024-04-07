import 'package:ecommerce/controller/product_details_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChanegColor extends StatelessWidget {
  const ChanegColor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsControllerImp>(
      builder: (controller) => Row(
        children: List.generate(
          controller.colors.length,
          (i) => InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: horizontalSize(3)),
              height: verticalSized(60),
              width: horizontalSize(80),
              decoration: BoxDecoration(
                color: '1' == controller.colors[i]['active']
                    ? AppColor.forthColor
                    : null,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColor.forthColor),
              ),
              child: Text(
                controller.colors[i]['name'],
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: '1' == controller.colors[i]['active']
                        ? AppColor.white
                        : const Color.fromARGB(255, 91, 77, 179)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
