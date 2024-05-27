import 'package:ecommerce/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CustomSelectedAddressCard extends StatelessWidget {
  const CustomSelectedAddressCard({
    super.key,
    required this.isActive,
  });
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: isActive ? AppColor.secondaryColor : AppColor.white,
      child: ListTile(
        title: Text(
          "Home",
          style: TextStyle(
              color: isActive ? AppColor.white : AppColor.black,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "Damascus Street One Building 23",
          style: TextStyle(
              color: isActive ? AppColor.white : AppColor.black,
              fontWeight: FontWeight.w200),
        ),
      ),
    );
  }
}
