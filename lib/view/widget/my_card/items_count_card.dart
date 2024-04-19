import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';

class ItemsCountCard extends StatelessWidget {
  const ItemsCountCard({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsetsDirectional.only(top: verticalSized(8)),
      height: verticalSized(30),
      decoration: BoxDecoration(
          color: AppColor.thirdColor, borderRadius: BorderRadius.circular(24)),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: AppColor.primaryColor),
      ),
    );
  }
}
