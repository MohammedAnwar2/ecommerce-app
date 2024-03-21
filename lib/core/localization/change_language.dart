import 'package:ecommerce/core/constant/app_theme.dart';
import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLanguageController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find<MyServices>();
  ThemeData appTheme = themeEnglish;

  changeLangauge(String lang) {
    language = Locale(lang);
    lang == 'ar' ? appTheme = themeArabic : appTheme = themeEnglish;
    myServices.sharePref.setString(AppKey.language, lang);
    Get.changeTheme(appTheme);
    Get.updateLocale(language!);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharePref.getString(AppKey.language);
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      Get.deviceLocale!.languageCode == 'ar'
          ? appTheme = themeArabic
          : appTheme = themeEnglish;
    }
    Get.changeTheme(appTheme);
    super.onInit();
  }
}
