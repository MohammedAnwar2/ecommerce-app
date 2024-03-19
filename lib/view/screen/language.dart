import 'package:ecommerce/core/localization/change_language.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/route/route_app.dart';
import 'package:ecommerce/view/widget/language/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<MyLanguageController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "1".tr,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          verticalSizedBox(25),
          CustomLanguageButton(
            buttonName: "2".tr,
            onTap: () {
              Get.offAllNamed(AppRoute.Onbording);
              controller.changeLangauge("ar");
            },
          ),
          verticalSizedBox(10),
          CustomLanguageButton(
            buttonName: "3".tr,
            onTap: () {
              Get.offAllNamed(AppRoute.Onbording);
              controller.changeLangauge("en");
            },
          )
        ],
      ),
    )));
  }
}