import 'package:ecommerce/binding/initilization_binding.dart';
import 'package:ecommerce/core/localization/change_language.dart';
import 'package:ecommerce/core/localization/translation.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/route/routes.dart';
import 'package:ecommerce/view/screen/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context); //first
    MyLanguageController controller = Get.put(MyLanguageController()); //second
    //otherwise will go wrong
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          translations: LocalizationModel(),
          locale: controller.language,
          debugShowCheckedModeBanner: false,
          title: 'Ecommerce',
          getPages: getPages,
          initialBinding: MyPageBinding(),
          theme: controller.appTheme,
        );
      },
    );
  }
}
