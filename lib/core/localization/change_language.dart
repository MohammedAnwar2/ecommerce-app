import 'package:ecommerce/core/constant/keys.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLanguageController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find<MyServices>();

  changeLangauge(String lang) {
    language = Locale(lang);
    myServices.sharePref.setString(AppKey.language, lang);
    Get.updateLocale(language!);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharePref.getString(AppKey.language);
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      // myServices.sharePref.setString(
      //     AppKey.language,
      //     Get.deviceLocale!
      //         .languageCode); //عرفه افضل في داله الخدمات <services>
    }
    super.onInit();
  }
}
