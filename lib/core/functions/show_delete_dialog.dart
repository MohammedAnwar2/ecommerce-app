import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> showDeleteDialog(Function()? onConfirm) async {
  await Get.defaultDialog(
      title: "Warning",
      content: Text(
        "Do you want to cancel this order ? ",
        style: TextStyle(
            fontSize: fontSize(15),
            fontWeight: FontWeight.w800,
            color: AppColor.grey500),
      ),
      titleStyle: TextStyle(
        color: AppColor.secondaryColor,
        fontWeight: FontWeight.bold,
      ),
      buttonColor: AppColor.primaryColor,
      cancelTextColor: AppColor.secondaryColor,
      onConfirm: onConfirm,
      onCancel: () {});
}
