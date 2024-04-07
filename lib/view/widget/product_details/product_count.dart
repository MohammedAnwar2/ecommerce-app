import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';

class ProductCount extends StatelessWidget {
  const ProductCount({
    super.key,
    required this.onRemove,
    required this.onAdd,
    required this.count,
    required this.price,
  });
  final void Function() onRemove;
  final void Function() onAdd;
  final String count;
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
              icon: Icon(Icons.add),
            ),
            Container(
              alignment: Alignment.center,
              width: horizontalSize(50),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.black),
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                count,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColor.forthColor, fontFamily: "", height: 1.6),
              ),
            ),
            IconButton(
              onPressed: onRemove,
              icon: Icon(Icons.remove),
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
