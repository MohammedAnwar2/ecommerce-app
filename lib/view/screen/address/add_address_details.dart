import 'package:ecommerce/controller/address/add_address_details_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressDetails extends StatelessWidget {
  const AddAddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressPart2ControllerImp addAddress =
        Get.put(AddAddressPart2ControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Address Details",
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.white),
        ),
        iconTheme: const IconThemeData(color: AppColor.white),
      ),
      body: Container(),
    );
  }
}
