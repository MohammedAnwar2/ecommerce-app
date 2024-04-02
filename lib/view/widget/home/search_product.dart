import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/shared/horizontal_and_vertical_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchProduct extends StatelessWidget {
  const SearchProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: "Find Product",
        hintStyle: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontSize: fontSize(18)),
        filled: true,
        fillColor: AppColor.grey200,
        prefixIcon: const Icon(
          Icons.search,
        ),
      ),
    );
  }
}
