import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/components/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size(0, 0), child: AppBar()),
      body: ListView(
        padding: EdgeInsetsDirectional.symmetric(
            vertical: verticalSized(10), horizontal: horizontalSize(16)),
        children: [
          CustomAppBar(
            hintText: "62".tr,
            onPressedSearch: () {
              print("onPressedSearch");
            },
            onPressedFavorite: () {
              print("onPressedFavorite");
            },
          )
        ],
      ),
    );
  }
}
