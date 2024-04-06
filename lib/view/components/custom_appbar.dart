import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.hintText,
    this.onPressedNotification,
    this.onPressedSearch,
  });
  final String hintText;
  final void Function()? onPressedNotification;
  final void Function()? onPressedSearch;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintText: hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: fontSize(18)),
              filled: true,
              fillColor: AppColor.grey200,
              prefixIcon: IconButton(
                onPressed: onPressedSearch,
                icon: const Icon(
                  Icons.search,
                ),
              ),
            ),
          ),
        ),
        horizontalSizedBox(10),
        Container(
          width: horizontalSize(60),
          padding: EdgeInsetsDirectional.symmetric(vertical: verticalSized(8)),
          decoration: BoxDecoration(
              color: AppColor.grey200, borderRadius: BorderRadius.circular(10)),
          child: IconButton(
            onPressed: onPressedNotification,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: Icon(
              Icons.notifications_active_outlined,
              color: AppColor.grey600,
              size: 30,
            ),
          ),
        )
      ],
    );
  }
}
