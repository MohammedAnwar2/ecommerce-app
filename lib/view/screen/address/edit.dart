import 'package:flutter/material.dart';

class EditAddress extends StatelessWidget {
  const EditAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Address"),
      ),
      body: const Center(
        child: Text("Edit Address"),
      ),
    );
  }
}
