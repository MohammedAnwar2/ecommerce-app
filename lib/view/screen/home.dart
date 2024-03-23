import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/route/route_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MyServices myServices = Get.find<MyServices>();

  bool x = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  x = true;
                });
                myServices.sharePref.setBool(AppKey.loginMiddleware, false);
                Get.offAllNamed(AppRoute.login);
              },
              child: Text("Logout"))
        ],
        title: const Text('Home'),
      ),
      body: x == false
          ? const Center(
              child: Text('Hello World'),
            )
          : const Center(
              child: Text('Loading'),
            ),
    );
  }
}
