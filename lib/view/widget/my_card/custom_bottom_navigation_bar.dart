import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:ecommerce/view/widget/my_card/coupon_button.dart';
import 'package:ecommerce/view/widget/my_card/coupon_text_form_field.dart';
import 'package:ecommerce/view/widget/my_card/place_order_button.dart';
import 'package:ecommerce/view/widget/my_card/custom_finaly_card_price.dart';
import 'package:flutter/material.dart';

class CustombottomNavigationBar extends StatelessWidget {
  const CustombottomNavigationBar({
    super.key,
    required this.price,
    required this.discount,
    required this.totalPrice,
    this.couponCintroller,
    required this.shipping,
  });
  final String price;
  final String discount;
  final String shipping;
  final String totalPrice;
  final TextEditingController? couponCintroller;
  @override
  Widget build(BuildContext context) {
    final FocusScopeNode focusScopeNode = FocusScope.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: horizontalSize(8)),
          child: Row(mainAxisSize: MainAxisSize.max, children: [
            Expanded(
              flex: 2,
              child: CouponTextFormField(couponCintroller: couponCintroller),
            ),
            horizontalSizedBox(8),
            Expanded(
                child: CustomCouponButton(
              text: "apply",
              onCoupon: () {},
            )),
          ]),
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
                text: "Place Order",
                onPlaceOrder: () {
                  focusScopeNode.unfocus();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
