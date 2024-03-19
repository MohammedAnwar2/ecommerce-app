import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharePref;

  Future<MyServices> init() async {
    sharePref = await SharedPreferences.getInstance();
    await ScreenUtil.ensureScreenSize();
    return this;
  }
}

initServices() async {
  await Get.putAsync(() => MyServices().init());
}
