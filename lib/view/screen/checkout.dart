import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_imageassets.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/checkout/checkout_botton.dart';
import 'package:ecommerce/view/widget/checkout/custom_title_text.dart';
import 'package:ecommerce/view/widget/checkout/delivery_type_bottom.dart';
import 'package:ecommerce/view/widget/checkout/payment_method_bottom.dart';
import 'package:ecommerce/view/widget/checkout/selected_address_bottom.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CheckoutBotton(
        onPressed: () {},
      ),
      appBar: AppBar(title: const Text("CheckOut")),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: horizontalSize(16)),
        children: [
          const CustomTitleCeckoutText(text: "Choose Payment Method"),
          CustomSelectedPaymentMehtodBottom(
            isActive: true,
            text: "Cash",
            onPressed: () {},
          ),
          CustomSelectedPaymentMehtodBottom(
            isActive: false,
            text: "Payment Cards",
            onPressed: () {},
          ),
          verticalSizedBox(14),
          const CustomTitleCeckoutText(text: "Choose Delivery Type"),
          verticalSizedBox(3),
          Row(
            children: [
              CustomSelectedDeliveryType(
                image: AppImages.deliveryman,
                isActive: true,
                typeName: "Delivery",
                onTap: () {
                  print(1);
                },
              ),
              horizontalSizedBox(10),
              CustomSelectedDeliveryType(
                image: AppImages.deliverycar,
                isActive: false,
                typeName: "Drive Thru",
                onTap: () {
                  print(2);
                },
              ),
            ],
          ),
          verticalSizedBox(16),
          const CustomTitleCeckoutText(text: "Choose Delivery Type"),
          const CustomSelectedAddressCard(isActive: true),
          const CustomSelectedAddressCard(isActive: false)
        ],
      ),
    );
  }
}
