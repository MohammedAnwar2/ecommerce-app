import 'package:ecommerce/controller/address/add_address_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressControllerIma addAddress = Get.put(AddAddressControllerIma());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Address",
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.white),
        ),
        iconTheme: const IconThemeData(color: AppColor.white),
      ),
      body: const Center(
        child: Text("Add Address"),
      ),
    );
  }
}
