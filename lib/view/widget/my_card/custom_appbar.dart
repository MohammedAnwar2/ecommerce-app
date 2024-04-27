import 'package:ecommerce/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCardAppBar extends StatelessWidget {
  const MyCardAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back, size: 30)),
        Expanded(child: Container()),
        Text(
          title,
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
