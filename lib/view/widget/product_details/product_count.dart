import 'package:ecommerce/controller/product_details_controller.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ProductCount extends StatelessWidget {
  const ProductCount({
    super.key,
    required this.onRemove,
    required this.onAdd,
    required this.price,
  });
  final void Function() onRemove;
  final void Function() onAdd;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: onAdd,
              icon: const Icon(Icons.add),
            ),
            GetBuilder<ProductDetailsControllerImp>(
              builder: (controller) {
                return HandlingDataView(
                  width: horizontalSize(40),
                  hight: horizontalSize(40),
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    alignment: Alignment.center,
                    width: horizontalSize(50),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.black),
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      controller.count.toString(),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColor.forthColor,
                          fontFamily: "",
                          height: 1.6),
                    ),
                  ),
                );
              },
            ),
            IconButton(
              onPressed: onRemove,
              icon: const Icon(Icons.remove),
            ),
          ],
        ),
        Text(
          "$price\$",
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: AppColor.primaryColor,
              ),
        ),
      ],
    );
  }
}
