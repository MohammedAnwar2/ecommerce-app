import 'package:ecommerce/core/middleware/login_middleware.dart';
import 'package:ecommerce/core/middleware/onboarding_middleware.dart';
import 'package:ecommerce/routes/route_app.dart';
import 'package:ecommerce/view/screen/address/add.dart';
import 'package:ecommerce/view/screen/address/edit.dart';
import 'package:ecommerce/view/screen/address/view.dart';
import 'package:ecommerce/view/screen/auth/forgetPassword/forgetpassword.dart';
import 'package:ecommerce/view/screen/auth/forgetPassword/resetpassword.dart';
import 'package:ecommerce/view/screen/auth/forgetPassword/success_resetpassword.dart';
import 'package:ecommerce/view/screen/auth/forgetPassword/verifycode_forgetpassword.dart';
import 'package:ecommerce/view/screen/auth/signup.dart';
import 'package:ecommerce/view/screen/auth/success_signup.dart';
import 'package:ecommerce/view/screen/auth/verifycode_signup.dart';
import 'package:ecommerce/view/screen/home_page.dart';
import 'package:ecommerce/view/screen/home_screen.dart';
import 'package:ecommerce/view/screen/items.dart';
import 'package:ecommerce/view/screen/my_card.dart';
import 'package:ecommerce/view/screen/my_favorite.dart';
import 'package:ecommerce/view/screen/onbording.dart';
import 'package:ecommerce/view/screen/auth/login.dart';
import 'package:ecommerce/view/screen/language.dart';
import 'package:ecommerce/view/screen/product_details.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? getPages = [
  //auth
  GetPage(
    name: AppRoute.login,
    // page: () => Test(),
    page: () => const Login(),
    transition: Transition.fade,
    middlewares: [
      LoginMiddleware(),
    ],
  ),
  GetPage(name: AppRoute.signUp, page: () => const SignUp(), transition: Transition.fade),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword(), transition: Transition.fade),
  GetPage(name: AppRoute.verifyCodeForgetPassword, page: () => const VerifyCodeForgetPassword(), transition: Transition.fade),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword(), transition: Transition.fade),
  GetPage(name: AppRoute.successResetpassword, page: () => const SuccessResetpassword(), transition: Transition.fade),
  GetPage(name: AppRoute.successSignup, page: () => const SuccessSignup(), transition: Transition.fade),
  GetPage(name: AppRoute.verifyCodeSignUp, page: () => const VerifyCodeSignUp(), transition: Transition.fade),
  // onboarding
  GetPage(name: AppRoute.onbording, page: () => const Onboarding(), transition: Transition.fade),
  //first page
  GetPage(
    name: AppRoute.language,
    page: () => const Language(),
    transition: Transition.fade,
    middlewares: [
      AuthMiddleWare()
    ],
  ),
  //home page
  GetPage(
    name: AppRoute.homePage,
    page: () => const HomePage(),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoute.homeScreen,
    page: () => HomeScreen(),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoute.items,
    page: () => const Items(),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoute.productDetails,
    page: () => const ProductDetails(),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: AppRoute.myFavorite,
    page: () => const MyFavorite(),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: AppRoute.myCardScreen,
    page: () => const MyCardScreen(),
    transition: Transition.rightToLeftWithFade,
  ),
  //address
  GetPage(
    name: AppRoute.viewAddress,
    page: () => const ViewAddress(),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: AppRoute.addAddress,
    page: () => const AddAddress(),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: AppRoute.editAddress,
    page: () => const EditAddress(),
    transition: Transition.rightToLeftWithFade,
  ),
];