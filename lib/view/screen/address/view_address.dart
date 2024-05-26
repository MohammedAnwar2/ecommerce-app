import 'package:ecommerce/controller/address/view_address_controller.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/address/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAddress extends StatefulWidget {
  const ViewAddress({super.key});

  @override
  State<ViewAddress> createState() => _ViewAddressState();
}

class _ViewAddressState extends State<ViewAddress> {
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
      appBar: AppBar(title: Text("View Address")),
      body: GetBuilder<ViewAddressControllerIma>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              padding: EdgeInsetsDirectional.only(top: verticalSized(5)),
              itemCount: controller.viewAddressList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalSize(5)),
                  child: Card(
                    color: AppColor.grey200,
                    child: ListTile(
                      onLongPress: () {
                        controller.goToDeleteAddress();
                      },
                      onTap: () {
                        controller.goToEditAddress(index);
                      },
                      title: Text(controller.viewAddressList[index].addressName
                          .toString()),
                      subtitle: Text(controller
                          .viewAddressList[index].addressCity
                          .toString()),
                      trailing: Text(controller
                          .viewAddressList[index].addressStreet
                          .toString()),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
