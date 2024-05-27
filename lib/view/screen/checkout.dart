import 'package:ecommerce/controller/checkout_controller.dart';
import 'package:ecommerce/core/class/handling_data_veiw.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_imageassets.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/checkout/checkout_botton.dart';
import 'package:ecommerce/view/widget/checkout/custom_title_text.dart';
import 'package:ecommerce/view/widget/checkout/delivery_type_bottom.dart';
import 'package:ecommerce/view/widget/checkout/payment_method_bottom.dart';
import 'package:ecommerce/view/widget/checkout/selected_address_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutControllerImp checkoutController = Get.put(CheckoutControllerImp());
    return Scaffold(
      bottomNavigationBar: CheckoutBotton(
        onPressed: () {},
      ),
      appBar: AppBar(title: const Text("CheckOut")),
      body: GetBuilder<CheckoutControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              padding: EdgeInsets.symmetric(horizontal: horizontalSize(16)),
              children: [
                const CustomTitleCeckoutText(text: "Choose Payment Method"),
                Column(
                  children: [
                    CustomSelectedPaymentMehtodBottom(
                      isActive: controller.paymentType == "cash" ? true : false,
                      text: "Cash",
                      onPressed: () {
                        controller.choosePaymentMethod("cash");
                      },
                    ),
                    CustomSelectedPaymentMehtodBottom(
                      isActive: controller.paymentType == "card" ? true : false,
                      text: "Payment Cards",
                      onPressed: () {
                        controller.choosePaymentMethod("card");
                      },
                    ),
                  ],
                ),
                verticalSizedBox(14),
                const CustomTitleCeckoutText(text: "Choose Delivery Type"),
                verticalSizedBox(3),
                Row(
                  children: [
                    CustomSelectedDeliveryType(
                      image: AppImages.deliveryman,
                      isActive:
                          controller.deliveryType == "delivery" ? true : false,
                      typeName: "Delivery",
                      onTap: () {
                        controller.chooseDeliveryType("delivery");
                      },
                    ),
                    horizontalSizedBox(10),
                    CustomSelectedDeliveryType(
                      image: AppImages.deliverycar,
                      isActive:
                          controller.deliveryType == "recive" ? true : false,
                      typeName: "Drive Thru",
                      onTap: () {
                        controller.chooseDeliveryType("recive");
                      },
                    ),
                  ],
                ),
                if (controller.deliveryType == "delivery")
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSizedBox(16),
                      const CustomTitleCeckoutText(
                          text: "Choose Delivery Type"),
                      ...List.generate(
                        controller.viewAddressList.length,
                        (i) => CustomSelectedAddressCard(
                          onTap: () {
                            controller.chooseShippingAddress(controller
                                .viewAddressList[i].addressId
                                .toString());
                          },
                          isActive: controller.addressName ==
                              controller.viewAddressList[i].addressId
                                  .toString(),
                          viewAddress: controller.viewAddressList[i],
                        ),
                      )
                    ],
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
