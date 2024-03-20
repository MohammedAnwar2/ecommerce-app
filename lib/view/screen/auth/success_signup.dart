import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/route/route_app.dart';
import 'package:ecommerce/view/widget/auth/custom_auth_button.dart';
import 'package:ecommerce/view/widget/auth/custom_text_appbar_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignup extends StatelessWidget {
  const SuccessSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextAppBarTitleAuth(text: "32".tr),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [
          const Icon(
            Icons.check_circle_outlined,
            color: AppColor.primaryColor,
            size: 200,
          ),
          Text("37".tr),
          Text("38".tr),
          const Spacer(),
          Container(
            margin: const EdgeInsetsDirectional.symmetric(
                horizontal: 16, vertical: 35),
            width: double.infinity,
            child: CustomAuthButton(
              text: "31".tr,
              onPressed: () {
                Get.offNamed(AppRoute.login);
              },
            ),
          ),
        ]),
      ),
    );
  }
}
