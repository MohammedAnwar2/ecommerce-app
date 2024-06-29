// import 'package:ecommerce/controller/orders/details_controller.dart';
// import 'package:ecommerce/core/class/handling_data_veiw.dart';
// import 'package:ecommerce/core/constant/app_color.dart';
// import 'package:ecommerce/view/widget/orders/cccustom_google_map_card.dart';
// import 'package:ecommerce/view/widget/orders/custom_shipping_sddress_card.dart';
// import 'package:ecommerce/view/widget/orders/cutom_card_price.dart';
// import 'package:ecommerce/view/widget/orders/orders_table.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class OrderPendingDetails extends StatelessWidget {
//   const OrderPendingDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(OrderDetailsControllerImp());
//     return Scaffold(
//       appBar: AppBar(title: const Text("Order Details")),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: GetBuilder<OrderDetailsControllerImp>(
//           builder: (controller) {
//             return HandlingDataView(
//               statusRequest: controller.statusRequest,
//               widget: ListView(
//                 children: [
//                   Card(
//                     color: AppColor.white,
//                     child: Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           const OrdersTable(),
//                           // if (controller.pendingOrders!.ordersPricedelivery !=
//                           //     0)
//                           const Divider(),
//                           CustomPriceCard(
//                               text: "Delivery Price",
//                               price: controller
//                                   .ordersModel!.ordersPricedelivery!
//                                   .toString()),
//                           if (controller.ordersModel!.couponDiscount != null)
//                             CustomPriceCard(
//                                 text: "Coupon",
//                                 price:
//                                     "${controller.ordersModel!.couponDiscount!}%"
//                                         .toString()),

//                           CustomPriceCard(
//                               text: "Total Price",
//                               price: controller.ordersModel!.ordersTotalprice!
//                                   .toString()),
//                         ],
//                       ),
//                     ),
//                   ),
//                   if (controller.ordersModel!.ordersType == 0)
//                     CustomShippingAddressCard(
//                         ordersModel: controller.ordersModel!),
//                   if (controller.ordersModel!.ordersType == 0)
//                     const CustomGoogleMapCard()
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
