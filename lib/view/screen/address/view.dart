import 'package:flutter/material.dart';

class ViewAddress extends StatelessWidget {
  const ViewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Address"),
      ),
      body: const Center(
        child: Text("View Address"),
      ),
    );
  }
}
