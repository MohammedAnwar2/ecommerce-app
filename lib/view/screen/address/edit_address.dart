import 'package:ecommerce/controller/address/edit_address_controller.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/view/widget/address/completed_button.dart';
import 'package:ecommerce/view/widget/address/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EditAddress extends StatelessWidget {
  const EditAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditAddressControllerImp());
    return Scaffold(
      appBar: AppBar(title: Text("Edit Address")),
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
                        CompletedButton(
                          onPressed: () {
                            controller.goToEditAddressDetails();
                          },
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

// Adjust the import based on your project structure


