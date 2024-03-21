import 'package:ecommerce/controller/test_controller.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
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
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, i) => Text("${controller.data}"),
            ),
          );
        },
      ),
    );
  }
}
