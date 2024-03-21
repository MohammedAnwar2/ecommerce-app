import 'package:ecommerce/controller/test_controller.dart';
import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestDataController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Data'),
      ),
      body: GetBuilder<TestDataController>(
        builder: (controller) {
          if (StatusRequest.loading == controller.statusRequest) {
            return const Center(child: const Text("Loading"));
          } else if (StatusRequest.offlinefailure == controller.statusRequest) {
            return const Center(child: Text("Offlinefailure"));
          } else if (StatusRequest.serverfailure == controller.statusRequest) {
            return const Center(child: Text("Serverfailure"));
          } else {
            return ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, i) => Text("${controller.data}"));
          }
        },
      ),
    );
  }
}
