import 'package:ecommerce/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResendVerifyCodeButton extends StatelessWidget {
  const ResendVerifyCodeButton({
    super.key,
    this.onTap,
  });
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Center(
        child: Text("56".tr,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: AppColor.primaryColor,
                )),
      ),
      //color: AppColor.primaryColor
    );
  }
}
