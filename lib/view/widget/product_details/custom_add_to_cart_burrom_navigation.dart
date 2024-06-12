import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';

class CustomAddToCartBurromNavigation extends StatelessWidget {
  const CustomAddToCartBurromNavigation({
    super.key,
    required this.onPressed,
  });
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(horizontalSize(10)),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(8.0), // Adjust the radius value as needed
        ),
        color: AppColor.primaryColor,
        onPressed: onPressed,
        child: Text(
          "Go To Cart",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppColor.white),
        ),
      ),
    );
  }
}
