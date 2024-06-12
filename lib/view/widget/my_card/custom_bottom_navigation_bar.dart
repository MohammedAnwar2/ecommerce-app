import 'package:ecommerce/controller/my_card_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/my_card/coupon_button.dart';
import 'package:ecommerce/view/widget/my_card/coupon_text_form_field.dart';
import 'package:ecommerce/view/widget/my_card/place_order_button.dart';
import 'package:ecommerce/view/widget/my_card/custom_finaly_card_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustombottomNavigationBar extends GetView<MyCardControllerImp> {
  const CustombottomNavigationBar({
    super.key,
    required this.price,
    required this.discount,
    required this.totalPrice,
    this.couponController,
    required this.shipping,
  });
  final String price;
  final String discount;
  final String shipping;
  final String totalPrice;
  final TextEditingController? couponController;
  @override
  Widget build(BuildContext context) {
    final FocusScopeNode focusScopeNode = FocusScope.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: horizontalSize(8)),
          child: controller.couponName == null
              ? Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 2,
                      child: CouponTextFormField(
                          couponCintroller: couponController),
                    ),
                    horizontalSizedBox(8),
                    Expanded(
                      child: CustomCouponButton(
                        text: "Apply",
                        isThereData: controller.data.isNotEmpty,
                        onCoupon: () {
                          controller.checkCoupon();
                          focusScopeNode.unfocus();
                        },
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Text(
                      "Coupon Code '${controller.couponName.toString()}'",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: "",
                          color: AppColor.secondaryColor.withOpacity(0.9)))),
        ),
        verticalSizedBox(10),
        Container(
          margin:
              EdgeInsetsDirectional.symmetric(horizontal: horizontalSize(8)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomFinalyCardPrice(
                  shipping: shipping,
                  price: price,
                  discount: discount,
                  totalPrice: totalPrice),
              verticalSizedBox(14),
              CustomPlaceOrderButton(
                text: "Order",
                onPlaceOrder: () {
                  controller.goToCheckOut();
                },
              ),
              verticalSizedBox(8),
            ],
          ),
        ),
      ],
    );
  }
}
