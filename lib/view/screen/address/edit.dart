import 'package:ecommerce/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class EditAddress extends StatelessWidget {
  const EditAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Edit Address",
            style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColor.white),
          ),
          iconTheme: const IconThemeData(color: AppColor.white)),
      body: const Center(
        child: Text("Edit Address"),
      ),
    );
  }
}
