import 'package:ecommerce/controller/address/view_address_controller.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
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
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.white),
        ),
        iconTheme: const IconThemeData(color: AppColor.white),
      ),
      body: GetBuilder<ViewAddressControllerIma>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.viewAddressList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      controller.viewAddressList[index].addressName.toString()),
                  subtitle: Text(
                      controller.viewAddressList[index].addressCity.toString()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
