import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';

class CouponTextFormField extends StatelessWidget {
  const CouponTextFormField({
    super.key,
    required this.couponCintroller,
  });

  final TextEditingController? couponCintroller;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.zero,
          isDense: true,
        ),
      ),
      child: TextFormField(
        controller: couponCintroller,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          hintText: "Coupon Code",
          hintStyle: Theme.of(context).textTheme.bodyLarge,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.primaryColor)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.secondaryColor)),
          contentPadding: EdgeInsets.symmetric(
            vertical: verticalSized(1),
            horizontal: horizontalSize(10),
          ),
        ),
      ),
    );
  }
}
