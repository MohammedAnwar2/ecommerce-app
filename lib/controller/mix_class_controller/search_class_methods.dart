import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/data/datasource/remote/items/search.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:ecommerce/routes/route_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchMethodMix extends GetxController {
  late TextEditingController search;
  bool isSearch = false;
  bool isTyping = false;
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
        if (isSearch == true) {
          statusRequest = StatusRequest.nodata;
        } else {
          statusRequest = StatusRequest.success;
        }
        // Get.defaultDialog(
        //     title: response['status'].tr, middleText: response['status']);
      }
    }
    update();
  }

  onChangeSearch(String val) {
    if (val == "") {
      isSearch = false;
      statusRequest = StatusRequest.success;
      isTyping = false;
    } else {
      isTyping = true;
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

  deleteText() {
    search.clear();
    isSearch = false;
    isTyping = false;
    statusRequest = StatusRequest.success;
    update();
  }
}
