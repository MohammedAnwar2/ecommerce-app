import 'package:get/get.dart';

class LocalizationModel extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "ar": ar,
        "en": en,
      };
}

Map<String, String> ar = {"1": "اختر اللغة", "2": "عربي", "3": "انجليزي"};

Map<String, String> en = {
  "1": "Choose Language",
  "2": "Arabic",
  "3": "English"
};
