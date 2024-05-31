import 'package:ecommerce/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackbar(String text) {
  Get.snackbar(
    "",
    "",
    icon: const Icon(Icons.warning, color: Colors.white),
    snackPosition: SnackPosition.TOP,
    backgroundColor: AppColor.primaryColor,
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    duration: const Duration(seconds: 2),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.easeOutBack,
    titleText: const Text(
      "WARNING",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    messageText: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}
