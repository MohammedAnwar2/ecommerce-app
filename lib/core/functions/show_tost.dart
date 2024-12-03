import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

void showToast({required String text, double height = 0}) {
  MyServices services = Get.find<MyServices>();
  FToast fToast = FToast();
  fToast.init(services.navigatorKey.currentContext!);
  Widget toast = Container(
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
    margin: EdgeInsets.symmetric(horizontal: 16.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: AppColor.primaryColor,
    ),
    child: Wrap(
      direction: Axis.horizontal,
      children: [
        const Icon(Icons.soap, color: Colors.white),
        horizontalSizedBox(10),
        Text(
          text,
          style: const TextStyle(color: AppColor.white),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
  fToast.showToast(
    child: toast,
    toastDuration: const Duration(seconds: 2),
    positionedToastBuilder: (context, child) {
      return Positioned(
        top: MediaQuery.of(context).size.height / 2 + height,
        left: 0,
        right: 0,
        child: child, // Adjust -100 to position the toast horizontally centered
      );
    },
  );
}
//! steps to use this function
//! 1- setup the package "fluttertoast: ^8.2.6"
//! 2- add "late GlobalKey<NavigatorState> navigatorKey;" to services
//! 3- add "navigatorKey: services.navigatorKey" and "builder: FToastBuilder()," in  MaterialApp
