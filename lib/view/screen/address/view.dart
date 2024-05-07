import 'package:ecommerce/controller/address/view_address_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAddress extends StatelessWidget {
  const ViewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    ViewAddressControllerIma controller = Get.put(ViewAddressControllerIma());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.goToAddAddress();
        },
        child: const Icon(
          Icons.add,
          color: AppColor.white,
        ),
      ),
      appBar: AppBar(
        title: Text(
          "View Address",
          style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColor.white),
        ),
        iconTheme: const IconThemeData(color: AppColor.white),
      ),
      body: const Center(
        child: Text("View Address"),
      ),
    );
  }
}
