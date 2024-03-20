import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "PlayfairDisplay",
  textTheme: TextTheme(
    bodyLarge: TextStyle(
        color: AppColor.grey,
        fontSize: fontSize(14),
        // fontSize: fontSize(14),
        height: 2,
        fontWeight: FontWeight.bold),
    bodyMedium:
        TextStyle(color: AppColor.grey, fontSize: fontSize(14), height: 2),
    bodySmall:
        TextStyle(color: AppColor.grey, fontSize: fontSize(12), height: 2),
    displayLarge: TextStyle(
        color: AppColor.black,
        fontSize: fontSize(20),
        fontWeight: FontWeight.bold),
    displayMedium: TextStyle(
      color: AppColor.black,
      fontSize: fontSize(26),
      fontWeight: FontWeight.bold,
    ),
  ),
);

ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: TextTheme(
    bodyLarge: TextStyle(
        color: AppColor.grey,
        fontSize: fontSize(14),
        height: 2,
        fontWeight: FontWeight.bold),
    bodyMedium:
        TextStyle(color: AppColor.grey, fontSize: fontSize(14), height: 2),
    bodySmall:
        TextStyle(color: AppColor.grey, fontSize: fontSize(12), height: 2),
    displayLarge: TextStyle(
        color: AppColor.black,
        fontSize: fontSize(20),
        fontWeight: FontWeight.bold),
    displayMedium: TextStyle(
      color: AppColor.black,
      fontSize: fontSize(26),
      fontWeight: FontWeight.bold,
    ),
  ),
);
