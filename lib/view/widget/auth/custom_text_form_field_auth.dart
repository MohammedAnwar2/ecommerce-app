import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldAuth extends StatelessWidget {
  const CustomTextFormFieldAuth({
    super.key,
    required this.lable,
    required this.hint,
    required this.icon,
    required this.controller,
    required this.validator,
    required this.keyboardType,
  });
  final String lable;
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          label: Container(
              margin: const EdgeInsetsDirectional.symmetric(horizontal: 9),
              child: Text(lable)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsetsDirectional.symmetric(
              vertical: verticalSized(5), horizontal: horizontalSize(30)),
          suffixIcon: Icon(icon),
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 14),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
  }
}
