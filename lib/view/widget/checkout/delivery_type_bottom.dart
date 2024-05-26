import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSelectedDeliveryType extends StatelessWidget {
  const CustomSelectedDeliveryType({
    super.key,
    required this.image,
    required this.typeName,
    required this.isActive,
    this.onTap,
  });
  final String image;
  final String typeName;
  final bool isActive;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: verticalSized(3),
          horizontal: horizontalSize(17),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isActive ? AppColor.secondaryColor : AppColor.white,
          border: Border.all(color: AppColor.secondaryColor),
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              image,
              height: verticalSized(60),
              colorFilter: ColorFilter.mode(
                isActive ? AppColor.white : AppColor.background,
                isActive ? BlendMode.srcIn : BlendMode.dst,
              ),
            ),
            Text(
              typeName,
              style: TextStyle(
                  color: isActive ? AppColor.white : AppColor.secondaryColor,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
