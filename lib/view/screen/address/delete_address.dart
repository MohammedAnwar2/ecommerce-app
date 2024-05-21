import 'dart:io';

import 'package:ecommerce/controller/address/delete_address_controller.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteAddress extends StatelessWidget {
  const DeleteAddress({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DeleteAddressControllerIma());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await controller.deleteAddressFromButtom();
        },
        // ignore: prefer_const_constructors
        child: Icon(
          Icons.delete_outline,
          color: AppColor.white,
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Delete Address",
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.white),
        ),
        iconTheme: const IconThemeData(color: AppColor.white),
      ),
      body: GetBuilder<DeleteAddressControllerIma>(
        builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                padding: EdgeInsetsDirectional.only(top: verticalSized(5)),
                itemCount: controller.checkAddressItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: horizontalSize(5)),
                    child: Row(
                      children: [
                        Checkbox(
                          value: controller.checkAddressItems[index],
                          onChanged: (val) {
                            controller.selectAddressToDelete(index);
                          },
                        ),
                        Expanded(
                          // flex:
                          //     7, // Adjust the flex value if needed to give more space to the ListTile
                          child: Card(
                            color: AppColor.grey200,
                            child: ListTile(
                              title: Text(
                                controller.viewAddressList[index].addressName
                                    .toString(),
                              ),
                              subtitle: Text(
                                controller.viewAddressList[index].addressCity
                                    .toString(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ));
        },
      ),
    );
  }
}
