import 'package:ecommerce/controller/address/add_address_controller.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressPart1ControllerImp addAddress =
        Get.put(AddAddressPart1ControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Address",
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.white),
        ),
        iconTheme: const IconThemeData(color: AppColor.white),
      ),
      body: GetBuilder<AddAddressPart1ControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [
                if (addAddress.kGooglePlex != null)
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: addAddress.kGooglePlex!,
                          onMapCreated: (GoogleMapController controller) {
                            addAddress.completorController.complete(controller);
                          },
                        ),
                        Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.primaryColor),
                                onPressed: () {
                                  addAddress.goToAddAddressDetails();
                                },
                                child: const Text("Complete")))
                      ],
                    ),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
