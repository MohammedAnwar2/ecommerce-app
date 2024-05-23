import 'package:flutter/material.dart';

class CustomRowWidget extends StatelessWidget {
  CustomRowWidget(
      {super.key,
      required this.text,
      required this.price,
      required this.priceColor,
      required this.textColor,
      this.isPrice = true});
  final String text;
  final String price;
  final Color priceColor;
  final Color textColor;
  final bool? isPrice;
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
          isPrice! ? "$price \$" : "$price %",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontFamily: "", color: priceColor),
        ),
      ],
    );
  }
}
