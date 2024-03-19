import 'package:ecommerce/route/route_app.dart';
import 'package:ecommerce/view/screen/auth/signup.dart';
import 'package:ecommerce/view/screen/onbording.dart';
import 'package:ecommerce/view/screen/auth/login.dart';
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
      transition: Transition.fade),
  GetPage(
      name: AppRoute.Onbording,
      page: () => const Onbording(),
      transition: Transition.fade),
  GetPage(
      name: AppRoute.SignUp,
      page: () => const SignUp(),
      transition: Transition.fade),
];
