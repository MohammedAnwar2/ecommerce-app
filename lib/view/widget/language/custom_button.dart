import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';

class CustomLanguageButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const CustomLanguageButton(
      {super.key, required this.text, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: verticalSized(5)),
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColor.primaryColor,
        textColor: AppColor.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsetsDirectional.symmetric(
            vertical: 15, horizontal: horizontalSize(60)),
        child: Text(text,
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontSize: fontSize(15))),
      ),
    );
  }
}
