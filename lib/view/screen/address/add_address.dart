import 'package:ecommerce/controller/address/add_address_controller.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/view/widget/address/completed_button.dart';
import 'package:ecommerce/view/widget/address/custom_appbar.dart';
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
      appBar: AppBar(title: Text("Add Address")),
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
                          onTap: (latLng) {
                            addAddress.changeTheLocation(latLng);
                          },
                          markers: addAddress.markers,
                          mapType: MapType.normal,
                          initialCameraPosition: addAddress.kGooglePlex!,
                          onMapCreated: (GoogleMapController controller) {
                            addAddress.completorController.complete(controller);
                          },
                        ),
                        CompletedButton(
                          onPressed: () {
                            addAddress.goToAddAddressDetails();
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
