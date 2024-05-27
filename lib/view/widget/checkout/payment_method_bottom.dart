import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';

class CustomSelectedPaymentMehtodBottom extends StatelessWidget {
  const CustomSelectedPaymentMehtodBottom({
    super.key,
    this.onPressed,
    required this.text,
    required this.isActive,
  });
  final void Function()? onPressed;
  final String text;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalSize(14)),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: isActive ? AppColor.secondaryColor : AppColor.thirdColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: isActive ? AppColor.white : AppColor.secondaryColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
