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
    AddAddressControllerIma addAddress = Get.put(AddAddressControllerIma());
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
      body: GetBuilder<AddAddressControllerIma>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [
                if (addAddress.kGooglePlex != null)
                  Expanded(
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: addAddress.kGooglePlex!,
                      onMapCreated: (GoogleMapController controller) {
                        addAddress.completorController.complete(controller);
                      },
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
