import 'package:ecommerce/binding/initilization_binding.dart';
import 'package:ecommerce/core/localization/change_language.dart';
import 'package:ecommerce/core/localization/translation.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:device_preview/device_preview.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

  runApp(
    DevicePreview(
      builder: (context) => EcommerceUsersApp(), // Wrap your app
    ),
  );
}

class EcommerceUsersApp extends StatelessWidget {
  const EcommerceUsersApp({super.key});
  @override
  Widget build(BuildContext context) {
    MyServices services = Get.find<MyServices>();
    ScreenUtil.init(context); //first
    MyLanguageController controller = Get.put(MyLanguageController()); //second
    //otherwise will go wrong
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
           useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
          navigatorKey: services.navigatorKey,
          translations: LocalizationModel(),
          locale: controller.language,
          debugShowCheckedModeBanner: false,
          title: '57'.tr,
          getPages: getPages,
          initialBinding: MyPageBinding(),
          theme: controller.appTheme,
        );
      },
    );
  }
}
// import 'package:ecommerce/binding/initilization_binding.dart';
// import 'package:ecommerce/core/localization/change_language.dart';
// import 'package:ecommerce/core/localization/translation.dart';
// import 'package:ecommerce/core/services/service.dart';
// import 'package:ecommerce/routes/routes.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await initServices();
//   runApp(EcommerceUsersApp());
// }

// class EcommerceUsersApp extends StatelessWidget {
//   const EcommerceUsersApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//   MyServices services = Get.find<MyServices>();
//     ScreenUtil.init(context); //first
//     MyLanguageController controller = Get.put(MyLanguageController()); //second
//     //otherwise will go wrong
//     return ScreenUtilInit(
//       designSize: const Size(360, 690),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (_, child) {
//         return GetMaterialApp(
//           navigatorKey: services.navigatorKey,
//           translations: LocalizationModel(),
//           locale: controller.language,
//           debugShowCheckedModeBanner: false,
//           title: '57'.tr,
//           getPages: getPages,
//           initialBinding: MyPageBinding(),
//           theme: controller.appTheme,
//         );
//       },
//     );
//   }
// }
