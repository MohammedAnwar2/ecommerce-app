import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/data/datasource/remote/items/search.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:ecommerce/route/route_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchMethodMix extends GetxController {
  late TextEditingController search;
  bool isSearch = false;
  List<ItemModel> searchItemList = [];
  StatusRequest statusRequest = StatusRequest.success;
  SearchItemsData searchItemData = SearchItemsData(Get.find());
  goToProductDetails(ItemModel itemModel) {
    Get.toNamed(
      AppRoute.productDetails,
      arguments: {
        "itemModel": itemModel,
      },
    );
  }

  searchData() async {
    searchItemList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await searchItemData.searchData(search.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List items = response['data'];
        searchItemList.addAll(items.map((e) => ItemModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.nodata;
        // Get.defaultDialog(
        //     title: response['status'].tr, middleText: response['status']);
      }
    }
    update();
  }

  onChangeSearch(String val) {
    if (val == "") {
      isSearch = false;
      // searchData();
    }
    update();
  }

  onClickSearch() {
    if (search.text.isNotEmpty) {
      isSearch = true;
      searchData();
      update();
    }
  }
}
