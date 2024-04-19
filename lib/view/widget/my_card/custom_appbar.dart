import 'package:ecommerce/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class MyCardAppBar extends StatelessWidget {
  const MyCardAppBar({
    super.key,
    required this.onPressed,
  });
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: onPressed, icon: const Icon(Icons.arrow_back, size: 30)),
        Expanded(child: Container()),
        Text(
          "My Cart",
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppColor.grey500),
        ),
        Expanded(child: Container()),
      ],
    );
  }
}
