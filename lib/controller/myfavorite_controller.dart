import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/data/datasource/remote/myfavorite.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:ecommerce/data/model/my_favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/data/datasource/remote/favorite/search_favorite.dart';
import 'package:ecommerce/routes/route_app.dart';

//FavoriteMethods
abstract class MyFavoriteController extends SearchFavorite {
  getData();
  deleteData(String favoriteId);
  initData();

  @override
  searchData();
  @override
  onClickSearch();
  @override
  onChangeSearch(String val);
  @override
  goToProductDetails(ItemModel itemModel);
}

class MyFavoriteControllerImp extends MyFavoriteController {
  MyFavoriteData myfavoriteData = MyFavoriteData(Get.find());
  MyServices services = Get.find<MyServices>();
  List<MyFavoriteModel> data = [];
  RxInt count = 0.obs;
  FavoriteControllerImp favoriteController = Get.put(FavoriteControllerImp());
  @override
  initData() {
    search = TextEditingController();
    id = services.sharePref.getInt(AppKey.usersId)!;
    getData();
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await myfavoriteData.getData(id.toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => MyFavoriteModel.fromJson(e)));
        count.value = data.length;
      } else {
        statusRequest = StatusRequest.nodata;
      }
    }
    update();
  }

  @override
  deleteData(String favoriteId) {
    var response = myfavoriteData.delteData(favoriteId);
    statusRequest = handlingData(response);
    data.removeWhere((element) => element.favoriteId.toString() == favoriteId);
    count.value = data.length - 1;
    //statusRequest = StatusRequest.nodata;
    update();
  }
}

//==============================================================================
class SearchFavorite extends GetxController {
  late TextEditingController search;
  bool isSearch = false;
  bool isTyping = false;
  late int id;
  List<ItemModel> searchItemList = [];
  StatusRequest statusRequest = StatusRequest.success;
  SearchFavoriteItemsData searchItemData = SearchFavoriteItemsData(Get.find());
  SearchFavoriteItemsData searchFavoriteItemData =
      SearchFavoriteItemsData(Get.find());
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
        searchItemList.map((e) => print(e.categoriesName));
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
