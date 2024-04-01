import 'package:ecommerce/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});
  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                controller.logoutApp();
              },
              child: Text("Logout"))
        ],
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(controller.name),
            Text(controller.email),
            Text(controller.phone),
            Text(controller.id.toString()),
          ],
        ),
      ),
    );
  }
}
