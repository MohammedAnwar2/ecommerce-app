import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

alearExitApp() {
  return Get.defaultDialog(
    title: '46'.tr,
    content: Text('45'.tr),
    actions: [
      TextButton(
        onPressed: () => Get.back(),
        child: Text('47'.tr),
      ),
      TextButton(
        onPressed: () => exit(0),
        child: Text('48'.tr),
      ),
    ],
  );
}
