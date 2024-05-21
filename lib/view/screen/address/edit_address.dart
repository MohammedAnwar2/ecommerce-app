import 'package:ecommerce/controller/address/edit_address_controller.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EditAddress extends StatelessWidget {
  const EditAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditAddressControllerImp());
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Edit Address",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.white),
          ),
          iconTheme: const IconThemeData(color: AppColor.white)),
      body: GetBuilder<EditAddressControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [
                if (controller.kGooglePlex != null)
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        GoogleMap(
                          onTap: (latLng) {
                            controller.changeTheLocation(latLng);
                          },
                          markers: controller.markers,
                          mapType: MapType.normal,
                          initialCameraPosition: controller.kGooglePlex!,
                          onMapCreated: (GoogleMapController controller) {
                            //  controller.completorController.complete(controller);
                          },
                        ),
                        Positioned(
                          bottom: 10,
                          // left: 0,
                          ///  right: 0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primaryColor),
                            onPressed: () {
                              controller.goToEditAddressDetails();
                            },
                            child: Text(
                              "Complete",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: AppColor.white),
                            ),
                          ),
                        )
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
