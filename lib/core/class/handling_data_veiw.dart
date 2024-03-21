import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_imageassets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget; // Assuming 'data' is a List<String>

  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    switch (statusRequest) {
      case StatusRequest.loading:
        return Center(
            child: Lottie.asset(AppImages.loading, width: 300, height: 300));
      case StatusRequest.offlinefailure:
        return Center(
            child: Lottie.asset(AppImages.offline, width: 300, height: 300));
      case StatusRequest.serverfailure:
        return Center(
            child: Lottie.asset(AppImages.server, width: 300, height: 300));
      case StatusRequest.nodata:
        return Center(
            child: Lottie.asset(AppImages.noData, width: 300, height: 300));
      default:
        return widget;
    }
  }
}
