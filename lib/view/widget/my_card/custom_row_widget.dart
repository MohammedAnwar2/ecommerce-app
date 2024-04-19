import 'package:flutter/material.dart';

class CustomRowWidget extends StatelessWidget {
  const CustomRowWidget({
    super.key,
    required this.text,
    required this.price,
    required this.priceColor,
    required this.textColor,
  });
  final String text;
  final String price;
  final Color priceColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style:
              Theme.of(context).textTheme.bodyLarge!.copyWith(color: textColor),
        ),
        Text(
          "$price \$",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontFamily: "", color: priceColor),
        ),
      ],
    );
  }
}
