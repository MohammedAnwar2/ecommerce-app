import 'package:ecommerce/core/middleware/login_middleware.dart';
import 'package:ecommerce/core/middleware/onboarding_middleware.dart';
import 'package:ecommerce/routes/route_app.dart';
import 'package:ecommerce/view/screen/notification.dart';
import 'package:ecommerce/view/screen/orders/archive.dart';
import 'package:ecommerce/view/screen/orders/archive_details.dart';
import 'package:ecommerce/view/screen/orders/pending_details.dart';
import 'package:ecommerce/view/screen/orders/pending.dart';
import 'package:ecommerce/view/screen/address/add_address.dart';
import 'package:ecommerce/view/screen/address/add_address_details.dart';
import 'package:ecommerce/view/screen/address/delete_address.dart';
import 'package:ecommerce/view/screen/address/edit_address.dart';
import 'package:ecommerce/view/screen/address/edit_address_details.dart';
import 'package:ecommerce/view/screen/address/view_address.dart';
import 'package:ecommerce/view/screen/auth/forgetPassword/forgetpassword.dart';
import 'package:ecommerce/view/screen/auth/forgetPassword/resetpassword.dart';
import 'package:ecommerce/view/screen/auth/forgetPassword/success_resetpassword.dart';
import 'package:ecommerce/view/screen/auth/forgetPassword/verifycode_forgetpassword.dart';
import 'package:ecommerce/view/screen/auth/signup.dart';
import 'package:ecommerce/view/screen/auth/success_signup.dart';
import 'package:ecommerce/view/screen/auth/verifycode_signup.dart';
import 'package:ecommerce/view/screen/checkout.dart';
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
  GetPage(
      name: AppRoute.signUp,
      page: () => const SignUp(),
      transition: Transition.fade),
  GetPage(
      name: AppRoute.forgetPassword,
      page: () => const ForgetPassword(),
      transition: Transition.fade),
  GetPage(
      name: AppRoute.verifyCodeForgetPassword,
      page: () => const VerifyCodeForgetPassword(),
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
      name: AppRoute.verifyCodeSignUp,
      page: () => const VerifyCodeSignUp(),
      transition: Transition.fade),
  //* onboarding
  GetPage(
      name: AppRoute.onbording,
      page: () => const Onboarding(),
      transition: Transition.fade),
  //first page
  GetPage(
    name: AppRoute.language,
    page: () => const Language(),
    transition: Transition.fade,
    middlewares: [AuthMiddleWare()],
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
  //* Address
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
  GetPage(
    name: AppRoute.editAddressDetails,
    page: () => const EditAddressDetails(),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: AppRoute.addAddressDetails,
    page: () => const AddAddressDetails(),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: AppRoute.deleteAddress,
    page: () => const DeleteAddress(),
    transition: Transition.rightToLeftWithFade,
  ),
  //*checkout
  GetPage(
      name: AppRoute.checkOut,
      page: () => const CheckOut(),
      transition: Transition.rightToLeftWithFade),
  GetPage(
      name: AppRoute.pendingorders,
      page: () => const PendingOrders(),
      transition: Transition.rightToLeftWithFade),
  GetPage(
      name: AppRoute.archiveorders,
      page: () => const ArchiveOrders(),
      transition: Transition.rightToLeftWithFade),
  GetPage(
      name: AppRoute.orderPendingDetails,
      page: () => const OrderPendingDetails(),
      transition: Transition.rightToLeftWithFade),
  GetPage(
      name: AppRoute.orderArchiveDetails,
      page: () => const OrderArchiveDetails(),
      transition: Transition.rightToLeftWithFade),
];
