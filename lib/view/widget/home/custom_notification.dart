import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomNotification extends StatelessWidget {
  const CustomNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: horizontalSize(60),
      padding: EdgeInsetsDirectional.symmetric(vertical: verticalSized(8)),
      decoration: BoxDecoration(
          color: AppColor.grey200, borderRadius: BorderRadius.circular(10)),
      child: IconButton(
        onPressed: () {},
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon: Icon(
          Icons.notifications_active_outlined,
          color: AppColor.grey600,
          size: 30,
        ),
      ),
    );
  }
}
