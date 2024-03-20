import 'package:ecommerce/route/route_app.dart';
import 'package:ecommerce/view/screen/auth/checkEmail.dart';
import 'package:ecommerce/view/screen/auth/forgetPassword/forgetpassword.dart';
import 'package:ecommerce/view/screen/auth/forgetPassword/resetpassword.dart';
import 'package:ecommerce/view/screen/auth/forgetPassword/success_resetpassword.dart';
import 'package:ecommerce/view/screen/auth/forgetPassword/verifycode.dart';
import 'package:ecommerce/view/screen/auth/signup.dart';
import 'package:ecommerce/view/screen/auth/success_signup.dart';
import 'package:ecommerce/view/screen/auth/verifycode_signup.dart';
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
      name: AppRoute.verifyCode,
      page: () => const VerifyCode(),
      transition: Transition.fade),
  GetPage(
      name: AppRoute.resetPassword,
      page: () => const ResetPassword(),
      transition: Transition.fade),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetpassword(),
      transition: Transition.fade),
  GetPage(
      name: AppRoute.successSignup,
      page: () => const SuccessSignup(),
      transition: Transition.fade),
  GetPage(
      name: AppRoute.checkEmail,
      page: () => const CheckEmail(),
      transition: Transition.fade),
  GetPage(
      name: AppRoute.verifyCodeSignUp,
      page: () => const VerifyCodeSignUp(),
      transition: Transition.fade),
  // onboarding
  GetPage(
      name: AppRoute.onbording,
      page: () => const Onboarding(),
      transition: Transition.fade),
  //first page
  GetPage(
      name: AppRoute.language,
      page: () => const Language(),
      transition: Transition.fade),
];
