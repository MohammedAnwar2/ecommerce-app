import 'package:ecommerce/controller/test_controller.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestDataController());
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.white.withOpacity(0.5)),
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
