import 'package:ecommerce/core/constant/app_imageassets.dart';
import 'package:flutter/material.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.logoAuth,
      height: 200,
    );
  }
}
