import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:get/get.dart';

translateDatabase({required String columnEn, required String columnAr}) {
  MyServices services = Get.find<MyServices>();
  if (services.sharePref.getString(AppKey.language) == 'ar') {
    return columnAr;
  } else {
    return columnEn;
  }
}
