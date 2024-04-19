import 'dart:ffi';

import 'package:ecommerce/controller/settings_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_imageassets.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  SettingsControllerImp controller = Get.put(SettingsControllerImp());
  Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: Get.width / 2,
              width: Get.width,
              color: AppColor.primaryColor,
            ),
            Positioned(
              top: Get.width / 2.5,
              right: Get.width / 2.7,
              child: Container(
                padding: EdgeInsets.all(horizontalSize(4)),
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(100)),
                child: CircleAvatar(
                  radius: raduis(35),
                  backgroundColor: AppColor.grey200!.withOpacity(0.5),
                  backgroundImage: const AssetImage(AppImages.profile),
                ),
              ),
            ),
          ],
        ),
        verticalSizedBox(50),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: AppColor.white,
            child: Column(
              children: [
                ListTile(
                  title: const Text("Disable Notification"),
                  trailing: Switch(value: true, onChanged: (val) {}),
                ),
                const ListTile(
                  title: Text("Address"),
                  trailing: Icon(Icons.location_on_outlined),
                ),
                const ListTile(
                  title: Text("About us"),
                  trailing: Icon(Icons.help_outline_sharp),
                ),
                const ListTile(
                  title: Text("Contact us"),
                  trailing: const Icon(Icons.phone_callback_outlined),
                ),
                ListTile(
                  onTap: () {
                    controller.logout();
                  },
                  title: const Text("Logout"),
                  trailing: const Icon(Icons.logout_outlined),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}