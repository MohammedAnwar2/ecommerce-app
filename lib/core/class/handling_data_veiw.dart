import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_imageassets.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget; // Assuming 'data' is a List<String>
  double? width;
  double? hight;
  bool? isMargin;
  HandlingDataView(
      {super.key,
      required this.statusRequest,
      required this.widget,
      this.width = 300,
      this.hight = 300,
      this.isMargin = false});

  @override
  Widget build(BuildContext context) {
    switch (statusRequest) {
      case StatusRequest.loading:
        return Container(
          margin: isMargin == true
              ? EdgeInsets.only(top: verticalSized(200))
              : const EdgeInsets.only(),
          child: Center(
              child:
                  Lottie.asset(AppImages.loading, width: width, height: hight)),
        );
      case StatusRequest.offlinefailure:
        return Container(
          margin: isMargin == true
              ? EdgeInsets.only(top: verticalSized(200))
              : const EdgeInsets.only(),
          child: Center(
              child:
                  Lottie.asset(AppImages.offline, width: width, height: hight)),
        );
      case StatusRequest.serverfailure:
        return Container(
          margin: isMargin == true
              ? EdgeInsets.only(top: verticalSized(200))
              : const EdgeInsets.only(),
          child: Center(
              child:
                  Lottie.asset(AppImages.server, width: width, height: hight)),
        );
      case StatusRequest.nodata:
        return Container(
          margin: isMargin == true
              ? EdgeInsets.only(top: verticalSized(200))
              : const EdgeInsets.only(),
          child: Center(
              child:
                  Lottie.asset(AppImages.noData, width: width, height: hight)),
        );
      default:
        return widget;
    }
  }
}

// class HandlingDataView extends StatelessWidget {
//   final StatusRequest statusRequest;
//   final Widget widget;
//   const HandlingDataView(
//       {Key? key, required this.statusRequest, required this.widget})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return statusRequest == StatusRequest.loading
//         ? Center(
//             child: Lottie.asset(AppImages.loading, width: 250, height: 250))
//         : statusRequest == StatusRequest.offlinefailure
//             ? Center(
//                 child: Lottie.asset(AppImages.offline,
//                     width: 250, height: 250))
//             : statusRequest == StatusRequest.serverfailure
//                 ? Center(
//                     child: Lottie.asset(AppImages.server,
//                         width: 250, height: 250))
//                 : statusRequest == StatusRequest.serverfailure
//                     ? Center(
//                         child: Lottie.asset(AppImages.noData,
//                             width: 250, height: 250, repeat: true))
//                     : widget;
//   }
// }

// class HandlingDataRequest extends StatelessWidget {
//   final StatusRequest statusRequest;
//   final Widget widget;
//   const HandlingDataRequest(
//       {Key? key, required this.statusRequest, required this.widget})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return statusRequest == StatusRequest.loading
//         ? Center(
//             child: Lottie.asset(AppImages.loading, width: 250, height: 250))
//         : statusRequest == StatusRequest.offlinefailure
//             ? Center(
//                 child: Lottie.asset(AppImages.offline,
//                     width: 250, height: 250))
//             : statusRequest == StatusRequest.serverfailure
//                 ? Center(
//                     child: Lottie.asset(AppImages.server,
//                         width: 250, height: 250))
//                 : widget;
//   }
// }
