import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/data/model/view_address_model.dart';
import 'package:flutter/material.dart';

class CustomSelectedAddressCard extends StatelessWidget {
  const CustomSelectedAddressCard({
    super.key,
    required this.isActive,
    required this.viewAddress,
    this.onTap,
  });
  final bool isActive;
  final ViewAddressModel viewAddress;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: isActive ? AppColor.secondaryColor : AppColor.white,
        child: ListTile(
          title: Text(
            viewAddress.addressName.toString(),
            style: TextStyle(
                color: isActive ? AppColor.white : AppColor.black,
                fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            viewAddress.addressStreet.toString(),
            style: TextStyle(
                color: isActive ? AppColor.white : AppColor.black,
                fontWeight: FontWeight.w200),
          ),
        ),
      ),
    );
  }
}
