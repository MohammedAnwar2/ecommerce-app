import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:flutter/material.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget; // Assuming 'data' is a List<String>

  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    switch (statusRequest) {
      case StatusRequest.loading:
        return const Center(child: Text("Loading"));
      case StatusRequest.offlinefailure:
        return const Center(child: Text("Offline Failure"));
      case StatusRequest.serverfailure:
        return const Center(child: Text("Server Failure"));
      case StatusRequest.nodata:
        return const Center(child: Text("No Data"));
      default:
        return widget;
    }
  }
}
