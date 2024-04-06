import 'package:ecommerce/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    int i = Get.arguments['selectedCat'];
    List<CategoriesModel> category = Get.arguments['categoriesList'];
    return Scaffold(
      appBar: AppBar(
        title: Text(i.toString()),
      ),
      body: SafeArea(
          child: Center(
        child: Text(category[i].categoriesName!),
      )),
    );
  }
}
