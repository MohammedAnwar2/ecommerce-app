import 'package:ecommerce/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CompletedButton extends StatelessWidget {
  const CompletedButton({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: AppColor.primaryColor),
        onPressed: onPressed,
        child: Text(
          "Complete",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppColor.white),
        ),
      ),
    );
  }
}
