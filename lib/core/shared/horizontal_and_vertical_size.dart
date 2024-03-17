import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget horizontalSizedBox(int size) {
  return SizedBox(width: size.h);
}

Widget verticalSizedBox(int size) {
  return SizedBox(height: size.h);
}

double horizontalSize(int size) {
  return size.h;
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
