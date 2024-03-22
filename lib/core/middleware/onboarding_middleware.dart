import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/route/route_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices controller = Get.find<MyServices>();
  @override
  RouteSettings? redirect(String? route) {
    if (controller.sharePref.getBool(AppKey.onboardingMiddleware) == true) {
      return const RouteSettings(name: AppRoute.login);
    }
    return null;
  }
}
