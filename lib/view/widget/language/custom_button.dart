import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';

class CustomLanguageButton extends StatelessWidget {
  const CustomLanguageButton({
    super.key,
    this.onTap,
    required this.buttonName,
  });
  final void Function()? onTap;
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: horizontalSize(60), vertical: verticalSized(10)),
        decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(8)),
        child: Text(
          buttonName,
          style: const TextStyle(color: AppColor.white),
        ),
      ),
    );
  }
}
