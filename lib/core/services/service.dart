import 'package:ecommerce/firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

class MyServices extends GetxService {
  late SharedPreferences sharePref;

  Future<MyServices> init() async {
    sharePref = await SharedPreferences.getInstance();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await ScreenUtil.ensureScreenSize();
    return this;
  }
}

initServices() async {
  await Get.putAsync(() => MyServices().init());
}
