import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';

class DetailsTextTitle extends StatelessWidget {
  const DetailsTextTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.symmetric(vertical: verticalSized(15)),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(color: AppColor.forthColor),
      ),
    );
  }
}
