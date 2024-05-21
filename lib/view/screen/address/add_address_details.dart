import 'package:ecommerce/controller/address/add_address_details_controller.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/functions/validation.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/address/custom_address_button.dart';
import 'package:ecommerce/view/widget/auth/custom_text_form_field_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressDetails extends StatelessWidget {
  const AddAddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressDetailsControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Address Details",
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.white),
        ),
        iconTheme: const IconThemeData(color: AppColor.white),
      ),
      body: GetBuilder<AddAddressDetailsControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: SafeArea(
              child: Container(
                margin: EdgeInsetsDirectional.only(
                    top: verticalSized(20),
                    start: horizontalSize(16),
                    end: horizontalSize(16)),
                child: Column(
                  children: [
                    CustomTextFormFieldAuth(
                      hint: "City",
                      controller: controller.city,
                      lable: "Enter Your City",
                      icon: Icons.location_city_outlined,
                      validator: (val) {
                        return validationInput(
                            val: val!, min: 3, max: 50, type: "text");
                      },
                      obscureText: false,
                      keyboardType: TextInputType.datetime,
                    ),
                    verticalSizedBox(20),
                    CustomTextFormFieldAuth(
                      hint: "Enter Your Street",
                      controller: controller.street,
                      lable: "Street",
                      icon: Icons.streetview_outlined,
                      validator: (val) {
                        return validationInput(
                            val: val!, min: 3, max: 50, type: "text");
                      },
                      obscureText: false,
                      keyboardType: TextInputType.datetime,
                    ),
                    verticalSizedBox(20),
                    CustomTextFormFieldAuth(
                      hint: "Enter Your Location Name",
                      controller: controller.name,
                      lable: "Name",
                      icon: Icons.near_me_outlined,
                      validator: (val) {
                        return validationInput(
                            val: val!, min: 3, max: 50, type: "text");
                      },
                      obscureText: false,
                      keyboardType: TextInputType.datetime,
                    ),
                    verticalSizedBox(30),
                    CustomAddressButton(
                      text: "Add",
                      onPressed: () async {
                        await controller.addAddress();
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
