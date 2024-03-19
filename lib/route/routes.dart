import 'package:ecommerce/route/route_app.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword.dart';
import 'package:ecommerce/view/screen/auth/resetpassword.dart';
import 'package:ecommerce/view/screen/auth/signup.dart';
import 'package:ecommerce/view/screen/auth/verifycode.dart';
import 'package:ecommerce/view/screen/onbording.dart';
import 'package:ecommerce/view/screen/auth/login.dart';
import 'package:ecommerce/view/screen/language.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? getPages = [
  //auth
  GetPage(
      name: AppRoute.login,
      page: () => const Login(),
      transition: Transition.fade),
  GetPage(
      name: AppRoute.signUp,
      page: () => const SignUp(),
      transition: Transition.fade),
  GetPage(
      name: AppRoute.forgetPassword,
      page: () => const ForgetPassword(),
      transition: Transition.fade),
  GetPage(
      name: AppRoute.verfyCode,
      page: () => const VerfyCode(),
      transition: Transition.fade),
  GetPage(
      name: AppRoute.resetPassword,
      page: () => const ResetPassword(),
      transition: Transition.fade),
  // onboarding
  GetPage(
      name: AppRoute.onbording,
      page: () => const Onbording(),
      transition: Transition.fade),
  //first page
  GetPage(
      name: AppRoute.language,
      page: () => const Language(),
      transition: Transition.fade),
];
