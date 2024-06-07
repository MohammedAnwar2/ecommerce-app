import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/data/datasource/remote/items/search.dart';
import 'package:ecommerce/data/datasource/remote/offers/search.dart';
import 'package:ecommerce/data/datasource/remote/offers/view.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:ecommerce/routes/route_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//viewNotifications

mixin ViewOffersMethods {
  getOffers();
  goToProductDetails(ItemModel itemModel);
  //*-------------- search --------------
  searchData();
  onChangeSearch(String val);
  onClickSearch();
  deleteText();
  goToMyFavorite();
}

mixin ViewOffersVariables {
  StatusRequest statusRequest = StatusRequest.success;
  ViewOffersData viewOffers = ViewOffersData(Get.find());
  List<ItemModel> offersList = [];
  //*------------ search --------------------
  late TextEditingController search;
  bool isSearch = false;
  bool isTyping = false;
  List<ItemModel> searchItemList = [];
  SearchOffersData searchOffersItem = SearchOffersData(Get.find());
}

class ViewOffersControllerImp extends GetxController
    with ViewOffersMethods, ViewOffersVariables {
  @override
  goToProductDetails(ItemModel itemModel) {
    Get.toNamed(
      AppRoute.productDetails,
      arguments: {
        "itemModel": itemModel,
      },
    );
  }

  @override
  getOffers() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewOffers.viewOffers();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        offersList.clear();
        List data = response['data'];
        offersList.addAll(data.map((e) => ItemModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.nodata;
      }
    }

    update();
  }

  @override
  searchData() async {
    searchItemList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await searchOffersItem.searchOffers(search.text);
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

  @override
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

  @override
  onClickSearch() {
    if (search.text.isNotEmpty) {
      isSearch = true;
      searchData();
      update();
    }
  }

  @override
  deleteText() {
    search.clear();
    isSearch = false;
    isTyping = false;
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  goToMyFavorite() {
    Get.toNamed(AppRoute.myFavorite);
  }

  @override
  void onInit() {
    getOffers();
    search = TextEditingController();
    super.onInit();
  }
}
