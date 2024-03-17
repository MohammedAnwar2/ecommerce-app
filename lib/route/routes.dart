import 'package:ecommerce/route/route_app.dart';
import 'package:ecommerce/view/screen/auth/home_page.dart';
import 'package:ecommerce/view/screen/language.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(
      name: AppRoute.Login,
      page: () => const Login(),
      transition: Transition.fade),
  GetPage(
      name: AppRoute.Language,
      page: () => const Language(),
      transition: Transition.fade)
];
