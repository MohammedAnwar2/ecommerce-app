import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: "PlayfairDisplay",
        fontSize: fontSize(24),
        color: AppColor.primaryColor),
    elevation: 0,
    centerTitle: true,
    backgroundColor: AppColor.white,
    iconTheme:
        IconThemeData(color: AppColor.primaryColor, size: horizontalSize(25)),
  ),
  scaffoldBackgroundColor: AppColor.white,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor),
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
    displaySmall: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize(16),
        color: AppColor.white),
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
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
        fontFamily: "Cairo",
        fontWeight: FontWeight.bold,
        fontSize: fontSize(24),
        color: AppColor.primaryColor),
    elevation: 0,
    centerTitle: true,
    backgroundColor: AppColor.white,
    iconTheme:
        IconThemeData(color: AppColor.primaryColor, size: horizontalSize(25)),
  ),
  scaffoldBackgroundColor: AppColor.white,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor),
  fontFamily: "Cairo",
  textTheme: TextTheme(
    bodyLarge: TextStyle(
        color: AppColor.grey,
        fontSize: fontSize(14),
        height: 2,
        fontWeight: FontWeight.bold),
    displaySmall: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize(16),
        color: AppColor.white),
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
