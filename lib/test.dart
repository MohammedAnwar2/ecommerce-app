import 'package:dropdown_search/dropdown_search.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  Test({super.key});
  final countries = ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          // systemOverlayStyle:
          //     SystemUiOverlayStyle(statusBarColor: Colors.white.withOpacity(0.5)),
          title: const Text('Test Data'),
        ),
        body: Column(
          children: [
            DropdownSearch<String>(
              popupProps: PopupProps.menu(
                showSelectedItems: true,
                disabledItemFn: (String s) => s.startsWith('I'),
              ),
              items: countries,
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Menu mode",
                  hintText: "country in menu mode",
                ),
              ),
              onChanged: (value) => print(
                  'Selected item index: ${countries.indexOf(value!)}'), // Print index,
              selectedItem: "Brazil",
            )
          ],
        ));
  }
}
