import 'package:ecommerce/controller/localizationController.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/localization/translation.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/route/routes.dart';
import 'package:ecommerce/view/screen/Onbording.dart';
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
  MyLanguageController controller = Get.put(MyLanguageController());
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          translations: LocalizationModel(),
          locale: controller.language,
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          getPages: getPages,
          theme: ThemeData(
              fontFamily: "PlayfairDisplay",
              textTheme: TextTheme(
                  bodyLarge: TextStyle(
                      color: AppColor.grey, fontSize: fontSize(14), height: 2),
                  displayLarge: TextStyle(
                      color: AppColor.black,
                      fontSize: fontSize(20),
                      fontWeight: FontWeight.bold))),
          home: Onbording(),
        );
      },
    );
  }
}
