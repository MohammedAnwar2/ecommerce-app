import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget horizontalSizedBox(int size) {
  return SizedBox(width: size.w);
}

Widget verticalSizedBox(int size) {
  return SizedBox(height: size.h);
}

double horizontalSize(int size) {
  return size.w;
}

double verticalSized(int size) {
  return size.h;
}
// double size(int size) {
//   return size.h;
// }

double fontSize(int size) {
  return size.sp;
}

double raduis(int size) {
  return size.r;
}
